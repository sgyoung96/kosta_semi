package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Handler {//모든 요청 처리 클래스의 부모
	String process(HttpServletRequest request, HttpServletResponse response);
	//뷰페이지 경로 반환 타입 : String
	
	

}