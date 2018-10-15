package com.creamyfever.wow;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.creamyfever.wow.dao.DiscussionMapper;
import com.creamyfever.wow.vo.Discussion_log;
import com.creamyfever.wow.vo.Discussion_rooms;

public class EchoHandler extends TextWebSocketHandler {
	private Map<Integer, ArrayList<WebSocketSession>> room = new HashMap<Integer, ArrayList<WebSocketSession>>();
	private Map<Integer, InnerThread> threadList = new HashMap<Integer, InnerThread>();
	private Map<String, Double> gradeList = new HashMap<String, Double>();
	private boolean readyFlag = false;

	@Autowired
	SqlSession ssession;

	private class InnerThread extends Thread {
		private int roomnum;

		public InnerThread(int roomnum) {
			super();
			this.roomnum = roomnum;
		}

		public void ready() {
			readyFlag = true;
			for (int i = 10; i >= 0; i--) {
				try {
					for (WebSocketSession s : room.get(roomnum)) {
						try {
							s.sendMessage(new TextMessage("Timer!@#$" + i + "!@#$ready"));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					Thread.sleep(1000);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			readyFlag = false;
		}

		public void first() {
			for (int i = 10; i >= 0; i--) {
				try {
					for (WebSocketSession s : room.get(roomnum)) {
						try {
							s.sendMessage(new TextMessage("Timer!@#$" + i + "!@#$first"));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					Thread.sleep(1000);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		public void second() {
			for (int i = 10; i >= 0; i--) {
				try {
					for (WebSocketSession s : room.get(roomnum))
						s.sendMessage(new TextMessage("Timer!@#$" + i + "!@#$second"));
					Thread.sleep(1000);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		public void third() {
			for (int i = 10; i >= 0; i--) {
				try {
					for (WebSocketSession s : room.get(roomnum)) {
						try {
							s.sendMessage(new TextMessage("Timer!@#$" + i + "!@#$third"));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					Thread.sleep(1000);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		public void fourth() {
			for (int i = 10; i >= 0; i--) {
				try {
					for (WebSocketSession s : room.get(roomnum)) {
						try {
							s.sendMessage(new TextMessage("Timer!@#$" + i + "!@#$fourth"));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					Thread.sleep(1000);
				} catch (Exception e) {
					// this.interrupt();
				}
			}
		}

		public void grade() {
			for (WebSocketSession s : room.get(roomnum)) {
				try {
					s.sendMessage(new TextMessage("Timer!@#$" + 0 + "!@#$grade"));
				} catch (IOException e) {
					this.interrupt();
				}
			}
			try {
				Thread.sleep(500);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			int size = 0;
			for (WebSocketSession w : room.get(roomnum)) {
				Map<String, Object> mm = w.getAttributes();
				if (mm.get("userState").equals("관전")) {
					size++;
				}
			}
			if (size == 0) {
				DiscussionMapper mapper = ssession.getMapper(DiscussionMapper.class);
				Discussion_rooms disroom = mapper.select_dis_room(roomnum);
				disroom.setDis_grade(0);
				mapper.update_dis_grade(disroom);
			}
			for (int i = 20; i >= 0; i--) {
				try {
					for (WebSocketSession s : room.get(roomnum)) {
						try {
							s.sendMessage(new TextMessage("Timer!@#$" + i + "!@#$gradetime"));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					this.interrupt();
				}
			}
			for (WebSocketSession s : room.get(roomnum)) {
				try {
					s.sendMessage(new TextMessage("Timer!@#$종료!@#$end"));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		@Override
		public void run() {
			ready();
			first();
			second();
			third();
			fourth();
			grade();
		}
	}

	// 처음 접속했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		int roomnum = (Integer) map.get("roomnum");

		if (room.get(roomnum) == null) {
			room.put(roomnum, new ArrayList<WebSocketSession>());
		}
		room.get(roomnum).add(session);

		DiscussionMapper mapper = ssession.getMapper(DiscussionMapper.class);
		ArrayList<Discussion_log> dislog = mapper.printall_dis_log(roomnum);
		if (dislog != null) {
			for (int i = 0; i < dislog.size(); i++) {
				session.sendMessage(new TextMessage(dislog.get(i).getDis_log()));
			}
		}
		double grade = mapper.select_dis_room_grade(roomnum);

		if (grade == -1) {
			if (threadList.get(roomnum) == null) {
				threadList.put(roomnum, new InnerThread(roomnum));
			}

			int avo_size = 0, dis_size = 0;
			for (WebSocketSession w : room.get(roomnum)) {
				Map<String, Object> mm = w.getAttributes();
				if (mm.get("userState").equals("찬성")) {
					avo_size++;
				} else if (mm.get("userState").equals("반대")) {
					dis_size++;
				}
			}
			if (threadList.get(roomnum) != null && avo_size == 2 && dis_size == 2) {
				try {
					threadList.get(roomnum).start();
					Discussion_rooms disroom = mapper.select_dis_room(roomnum);
					disroom.setDis_grade(-2);
					mapper.update_dis_grade(disroom);
				} catch (IllegalThreadStateException e) {
					session.sendMessage(new TextMessage("Timer!@#$종료!@#$end"));
				}
			}
			if (threadList.get(roomnum).getState() == Thread.State.TERMINATED) {
				session.sendMessage(new TextMessage("Timer!@#$종료!@#$end"));
			} else {
				informUser(roomnum);
			}
		} else {
			session.sendMessage(new TextMessage("Timer!@#$종료!@#$end"));
		}
	}

	// 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map = session.getAttributes();
		int roomnum = (Integer) map.get("roomnum");
		DiscussionMapper mapper = ssession.getMapper(DiscussionMapper.class);

		if (message.getPayload().indexOf("!@#") != -1) {
			double g = Double.parseDouble(message.getPayload().split("!")[0]);
			gradeList.put(message.getPayload().split("#")[1], g);

			int size = 0;
			for (WebSocketSession w : room.get(roomnum)) {
				Map<String, Object> mm = w.getAttributes();
				if (mm.get("userState").equals("관전")) {
					size++;
				}
			}
			double result = 0;
			for (String key : gradeList.keySet()) {
				result += gradeList.get(key);
			}
			if (gradeList.size() == size) {
				double grade = result / gradeList.size();
				Discussion_rooms disroom = mapper.select_dis_room(roomnum);
				disroom.setDis_grade(grade);
				mapper.update_dis_grade(disroom);
			}
		} else {
			Discussion_log dislog = new Discussion_log();
			dislog.setDis_no(roomnum);
			dislog.setIdno((Integer) map.get("idno"));
			dislog.setDis_log(message.getPayload() + "!@#$" + (String) map.get("userState") + "!@#$"
					+ (String) map.get("loginName"));

			mapper.insert_dis_log(dislog);

			String state = (String) map.get("userState");
			if (readyFlag) {
				for (WebSocketSession sess : room.get(roomnum)) {
					Map<String, Object> sessmap = sess.getAttributes();
					String sess_state = (String) sessmap.get("userState");
					if (state.equals("찬성")) {
						if (sess_state.equals("찬성")) {
							sess.sendMessage(new TextMessage(message.getPayload() + "!@#$"
									+ (String) map.get("userState") + "!@#$" + (String) map.get("loginName")));
						}
					} else {
						if (sess_state.equals("반대")) {
							sess.sendMessage(new TextMessage(message.getPayload() + "!@#$"
									+ (String) map.get("userState") + "!@#$" + (String) map.get("loginName")));
						}
					}
				}
			} else {
				// logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
				for (WebSocketSession sess : room.get(roomnum)) {
					sess.sendMessage(new TextMessage(message.getPayload() + "!@#$" + (String) map.get("userState")
							+ "!@#$" + (String) map.get("loginName")));
				}
			}
		}
	}

	// 클라이언트가 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		int roomnum = (Integer) map.get("roomnum");
		informUser(roomnum);
		room.get(roomnum).remove(session);
	}

	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송오류 발생");
	}

	public void informUser(int roomnum) {
		JSONArray jarr = new JSONArray();
		for (int i = 0; i < room.get(roomnum).size(); i++) {
			Map<String, Object> map = room.get(roomnum).get(i).getAttributes();
			JSONArray ja = new JSONArray();
			ja.add(map.get("loginId"));
			ja.add(map.get("loginName"));
			ja.add(map.get("userState"));
			jarr.add(ja);
		}
		JSONObject jobj = new JSONObject();
		jobj.put("userList", jarr);

		String jsonStr = jobj.toJSONString();

		try {
			for (int i = 0; i < room.get(roomnum).size(); i++) {
				room.get(roomnum).get(i).sendMessage(new TextMessage(jsonStr));
			}
		} catch (Exception e) {
		}
	}
}