package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class Out implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		
		String userId = request.getParameter("userId");
		MemberService service = new MemberService();
		
		if(request.getMethod().equals("GET")) {
			MemberVo m = service.getMember(userId);
			System.out.println("userId :"+userId);
			request.setAttribute("m", m);
			System.out.println(m);
			return "/member/out.jsp";
			
		} else {
			
			service.delMember(userId);
			
			//로그아웃
			HttpSession sc = request.getSession(false);
			sc.invalidate();
			
			return "/member/outEnd.jsp";
			//request.setAttribute("view", "/member/outEnd.jsp");
		}
		//return "redirect:/main/page.do";
		
	}


}