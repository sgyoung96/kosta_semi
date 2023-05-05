package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class Join implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";

		if (request.getMethod().equals("GET")) {
			//request.setAttribute("view", "/member/join.jsp");
			//view = "/submain/populer.jsp";
			return "/member/join.jsp";
		} else {
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String nickname = request.getParameter("nickname");
			System.out.println("userid :"+userId+" / password :"+password+" / nickname :"+nickname);
			MemberService service = new MemberService();
			service.join(new MemberVo(userId, password, nickname, ""));
			view = "/member/login.jsp";
		}

		return view;
	}
}
