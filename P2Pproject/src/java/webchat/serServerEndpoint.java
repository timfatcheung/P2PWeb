/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webchat;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;
import javax.websocket.server.ServerEndpoint;



/**
 *
 * @author ctf
 */

@ServerEndpoint(value = "/webchat/{user}")
public class serServerEndpoint {
    private Session session;
    private static final Logger sysLogger = Logger.getLogger("sysLog");
   
    private static ConcurrentHashMap map = new ConcurrentHashMap();

    @OnOpen
    public void open(Session session, @PathParam(value = "user") String user) {
        if(!map.containsKey(user)){
           
            map.put(user,session);
        }
        sysLogger.info(" WebSocket opened" + session.getId());
    }

    @OnMessage
    public void inMessage(String message) throws Exception {
        String[] list = message.split(",");
        message = list[0]+":"+list[2];
        if("all".equals(list[1])){
            for (Object o : map.keySet()) {
                ((Session)map.get(o)).getBasicRemote().sendText(message);
            }
        }else{
            Session from = (Session)map.get(list[0]);
            Session to = (Session)map.get(list[1]);
            if(to!=null&&from!=null){
                from.getBasicRemote().sendText(message);
                to.getBasicRemote().sendText(message);
            }else {
                from.getBasicRemote().sendText("offline");
            }

        }
    }

    @OnClose
    public String end() throws Exception{
        return " WebSocket close " + this.session.getId();
    }

}
