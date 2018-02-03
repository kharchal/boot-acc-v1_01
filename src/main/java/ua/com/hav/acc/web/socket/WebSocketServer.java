package ua.com.hav.acc.web.socket;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

@ServerEndpoint("/app")
// Эта аннотация объявляет, что класс будет конечной точкой веб-сокета.
public class WebSocketServer {

    // methods should be named this way
    // (from old times of extending Endpoint)
    @OnClose
    public void onClose(Session session) {
        System.out.println("Close connection");
    }

    @OnError
    public void onError(Throwable e) {
        e.printStackTrace();
    }

    @OnOpen
    // methods should be named this way (from old times of extending Endpoint)
    public void onOpen(Session session, EndpointConfig endpointConfig) throws IOException {
        session.getBasicRemote().sendText("Connected");
        // if you need a Session
        HttpSession s = (HttpSession) endpointConfig.getUserProperties()
                .get(HttpSession.class.getName());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        message += " from server";
        //  Объект, представляющий партнера этой беседы, который может
        // отправлять сообщения (A)синхронно с одноранговым узлом.
        session.getBasicRemote().sendText(message);
        // session.getAsyncRemote().sendText(message);
    }
}
