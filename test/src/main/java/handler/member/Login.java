package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class Login implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String Allview = "";
		String msg = "아이디/비밀번호가 올바르지 않습니다.";
		
		if(request.getMethod().equals("GET")) {  
			return "/member/login.jsp";
			
		} else { 
			String userId = request.getParameter("userId");  
			String password = request.getParameter("password");  
			
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(userId);
			
			if(vo != null && password.equals(vo.getPassword())) {
				HttpSession session = request.getSession();   
				session.setAttribute("userId", userId);
			} else if(vo != null) {
				return msg;
			}
		}
		//return "/main/page.do";  
		return "/main/page.jsp";
		
	}


}