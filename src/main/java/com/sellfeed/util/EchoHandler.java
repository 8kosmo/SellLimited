package com.sellfeed.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private Map<String,List<WebSocketSession>> sessionMap = new HashMap<>();
	private List<WebSocketSession> sessionList = null;

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String sessionUri = session.getUri().toString();
		String real = sessionUri.split("\\?")[1];
		logger.info(real);
		String status = real.split("\\:")[0];
		String roomName = real.split("\\:")[1];
		logger.info(status+", "+roomName);
		if("roomCreate".equals(status)) {
			sessionList = new ArrayList<>();
			sessionMap.put(roomName, sessionList);
			logger.info(roomName+" 방을 생성");
		}
		else {
			sessionList = sessionMap.get(roomName);
			sessionList.add(session);
			logger.info("{} 연결됨", session.getId());
		}
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		String pullMessage = message.getPayload();
		String roomName = pullMessage.split("\\?")[0];
		String realMessage = pullMessage.split("\\?")[1];
		sessionList = sessionMap.get(roomName);
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + " : " + realMessage));
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		run_start:
		for(int i=0;i<sessionMap.size();i++) {
			Object[] keys = sessionMap.keySet().toArray();
			sessionList = sessionMap.get(keys[i]);
			for(int j=0;j<sessionList.size();j++) {
				if(session.equals(sessionList.get(j))) {
					sessionList.remove(j);
					logger.info("{} 연결 끊김", session.getId());
					break run_start;
				}
			}
		}
		
	}
}
