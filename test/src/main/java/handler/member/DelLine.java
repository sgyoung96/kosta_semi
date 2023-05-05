package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;

public class DelLine implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if(request.getMethod().equals("GET")) {
			
		} else {
			String userId = request.getParameter("userId");
			MemberService service= new MemberService();
			service.lineDel(userId);
			System.out.println("userId :"+userId);
			return "/member/mypage.do";
		}
		return null;
	}

}
