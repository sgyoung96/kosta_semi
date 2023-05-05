package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;

public class LineAdd implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 한줄소개 넣을 그거..
		System.out.println("핸들러멤버 LineAdd");
		if(request.getMethod().equals("GET")) {
			
		} else {
			String introLine = request.getParameter("introLine");
			String userId = request.getParameter("userId");
			System.out.println("introLine :" + introLine + " / userId :"+userId);
			
			MemberService service=new MemberService();
			service.lineInsert(userId, introLine);
			//return "/member/mypage.jsp";
			return introLine;
		}
		
		return null;
	}

}
