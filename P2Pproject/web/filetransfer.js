var room = location.search && location.search.split('?')[1];

var webrtc = new SimpleWebRTC({
    localVideoEl: '',
    remoteVideosEl: '',
    autoRequestMedia: false,
    receiveMedia: {
        offerToReceiveAudio: false,
        offerToReceiveVideo: false
    }
});

webrtc.on('createdPeer', function (peer) {
    console.log('createdPeer', peer);
    var remotes = document.getElementById('remotes');
    if (!remotes) return;
    var container = document.createElement('div');
    container.className = 'peerContainer';
    container.id = 'container_' + webrtc.getDomId(peer);

    var peername = document.createElement('div');
    peername.className = 'peerName';
    peername.appendChild(document.createTextNode('Peer: ' + peer.id));
    container.appendChild(peername);

    var filelist = document.createElement('ul');
    filelist.className = 'fileList';
    container.appendChild(filelist);

    var fileinput = document.createElement('input');
    fileinput.type = 'file';
    fileinput.addEventListener('change', function() {
        fileinput.disabled = true;

        var file = fileinput.files[0];
        var sender = peer.sendFile(file);

        var item = document.createElement('li');
        item.className = 'sending';

        var span = document.createElement('span');
        span.className = 'filename';
        span.appendChild(document.createTextNode(file.name));
        item.appendChild(span);

        span = document.createElement('span');
        span.appendChild(document.createTextNode(file.size + ' bytes'));
        item.appendChild(span);

        var sendProgress = document.createElement('progress');
        sendProgress.max = file.size;
        item.appendChild(sendProgress);

        sender.on('progress', function (bytesSent) {
            sendProgress.value = bytesSent;
        });

        sender.on('sentFile', function () {
            item.appendChild(document.createTextNode('sent'));

            fileinput.removeAttribute('disabled');
        });
        sender.on('complete', function () {
        });
        filelist.appendChild(item);
    }, false);
    fileinput.disabled = 'disabled';
    container.appendChild(fileinput);

    if (peer && peer.pc) {
        var connstate = document.createElement('div');
        connstate.className = 'connectionstate';
        container.appendChild(connstate);
        peer.pc.on('iceConnectionStateChange', function (event) {
            var state = peer.pc.iceConnectionState;
            console.log('state', state);
            container.className = 'peerContainer p2p' + state.substr(0, 1).toUpperCase()
                + state.substr(1);
            switch (state) {
            case 'checking': 
                connstate.innerText = 'Connecting to peer...';
                break;
            case 'connected':
            case 'completed': 
                connstate.innerText = 'Connection established.';
                fileinput.removeAttribute('disabled');
                break;
            case 'disconnected':
                connstate.innerText = 'Disconnected.';
                break;
            case 'failed':
                break;
            case 'closed':
                connstate.innerText = 'Connection closed.';
                fileinput.disabled = 'disabled';
                break;
            }
        });
    }
    remotes.appendChild(container);

    peer.on('fileTransfer', function (metadata, receiver) {
        console.log('incoming filetransfer', metadata);
        var item = document.createElement('li');
        item.className = 'receiving';

        var span = document.createElement('span');
        span.className = 'filename';
        span.appendChild(document.createTextNode(metadata.name));
        item.appendChild(span);

        span = document.createElement('span');
        span.appendChild(document.createTextNode(metadata.size + ' bytes'));
        item.appendChild(span);

        var receiveProgress = document.createElement('progress');
        receiveProgress.max = metadata.size;
        item.appendChild(receiveProgress);

        receiver.on('progress', function (bytesReceived) {
            receiveProgress.value = bytesReceived;
        });

        receiver.on('receivedFile', function (file, metadata) {
            console.log('received file', metadata.name, metadata.size);
            var href = document.createElement('a');
            href.href = URL.createObjectURL(file);
            href.download = metadata.name;
            href.appendChild(document.createTextNode('download'));
            item.appendChild(href);
            receiver.channel.close();
        });
        filelist.appendChild(item);
    });
});

webrtc.on('iceFailed', function (peer) {
    var connstate = document.querySelector('#container_' + webrtc.getDomId(peer) + ' .connectionstate');
    var fileinput = document.querySelector('#container_' + webrtc.getDomId(peer) + ' input');
    console.log('local fail', connstate);
    if (connstate) {
        connstate.innerText = 'Connection failed.';
        fileinput.disabled = 'disabled';
    }
});

webrtc.on('connectivityError', function (peer) {
    var connstate = document.querySelector('#container_' + webrtc.getDomId(peer) + ' .connectionstate');
    var fileinput = document.querySelector('#container_' + webrtc.getDomId(peer) + ' input');
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
    webrtc.joinRoom(room, function (err, res) {
        console.log('joined', room, err, res);
    });
} else {
    $('form>button').attr('disabled', null);
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

