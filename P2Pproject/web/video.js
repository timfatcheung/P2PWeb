var room = location.search && location.search.split('?')[1];
var webrtc = new SimpleWebRTC({
    localVideoEl: 'localVideo',
    remoteVideosEl: '',
    autoRequestMedia: true,
    debug: false,
    detectSpeakingEvents: true,
    autoAdjustMic: false
});

webrtc.on('readyToCall', function () {
    if (room)
        webrtc.joinRoom(room);
});

function showVolume(el, volume) {
    if (!el)
        return;
    if (volume < -45)
        volume = -45; 
    if (volume > -20)
        volume = -20; 
    el.value = volume;
}

webrtc.on('localStream', function (stream) {
    var button = document.querySelector('form>button');
    if (button)
        button.removeAttribute('disabled');
    $('#localVolume').show();
});

webrtc.on('localMediaError', function (err) {
});

webrtc.on('localScreenAdded', function (video) {
    video.onclick = function () {
        video.style.width = video.videoWidth + 'px';
        video.style.height = video.videoHeight + 'px';
    };
    document.getElementById('localScreenContainer').appendChild(video);
    $('#localScreenContainer').show();
});

webrtc.on('localScreenRemoved', function (video) {
    document.getElementById('localScreenContainer').removeChild(video);
    $('#localScreenContainer').hide();
});

webrtc.on('videoAdded', function (video, peer) {
    console.log('video added', peer);
    var remotes = document.getElementById('remotes');
    if (remotes) {
        var container = document.createElement('div');
        container.className = 'videoContainer';
        container.id = 'container_' + webrtc.getDomId(peer);
        container.appendChild(video);

        video.oncontextmenu = function () {
            return false;
        };

        video.onclick = function () {
            container.style.width = video.videoWidth + 'px';
            container.style.height = video.videoHeight + 'px';
        };

        var vol = document.createElement('meter');
        vol.id = 'volume_' + peer.id;
        vol.className = 'volume';
        vol.min = -45;
        vol.max = -20;
        vol.low = -40;
        vol.high = -25;
        container.appendChild(vol);

        if (peer && peer.pc) {
            var connstate = document.createElement('div');
            connstate.className = 'connectionstate';
            container.appendChild(connstate);
            peer.pc.on('iceConnectionStateChange', function (event) {
                switch (peer.pc.iceConnectionState) {
                    case 'checking':
                        connstate.innerText = 'Connecting to peer...';
                        break;
                    case 'connected':
                    case 'completed': 
                        $(vol).show();
                        connstate.innerText = 'Connection established.';
                        break;
                    case 'disconnected':
                        connstate.innerText = 'Disconnected.';
                        break;
                    case 'failed':
                        connstate.innerText = 'Connection failed.';
                        break;
                    case 'closed':
                        connstate.innerText = 'Connection closed.';
                        break;
                }
            });
        }
        remotes.appendChild(container);
    }
});

webrtc.on('videoRemoved', function (video, peer) {
    console.log('video removed ', peer);
    var remotes = document.getElementById('remotes');
    var el = document.getElementById(peer ? 'container_' + webrtc.getDomId(peer) : 'localScreenContainer');
    if (remotes && el) {
        remotes.removeChild(el);
    }
});

webrtc.on('volumeChange', function (volume, treshold) {
    showVolume(document.getElementById('localVolume'), volume);
});

webrtc.on('remoteVolumeChange', function (peer, volume) {
    showVolume(document.getElementById('volume_' + peer.id), volume);
});

webrtc.on('iceFailed', function (peer) {
    var connstate = document.querySelector('#container_' + webrtc.getDomId(peer) + ' .connectionstate');
    console.log('local fail', connstate);
    if (connstate) {
        connstate.innerText = 'Connection failed.';
        fileinput.disabled = 'disabled';
    }
});

webrtc.on('connectivityError', function (peer) {
    var connstate = document.querySelector('#container_' + webrtc.getDomId(peer) + ' .connectionstate');
    console.log('remote fail', connstate);
    if (connstate) {
        connstate.innerText = 'Connection failed.';
        fileinput.disabled = 'disabled';
    }
});

function setRoom(name) {
    document.querySelector('form').remove();
    $('body').addClass('active');
}

if (room) {
    setRoom(room);
} else {
    $('form').submit(function () {
        var val = $('#sessionInput').val().toLowerCase().replace(/\s/g, '-').replace(/[^A-Za-z0-9_\-]/g, '');
        webrtc.createRoom(val, function (err, name) {
            console.log(' create room cb', arguments);

            var newUrl = location.pathname + '?' + name;
            if (!err) {
                history.replaceState({foo: 'bar'}, null, newUrl);
                setRoom(name);
            } else {
                console.log(err);
            }
        });
        return false;
    });
}
