package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;

public class Logout implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		HttpSession sc = request.getSession();
		sc.invalidate();
		System.out.println("Logout userId :"+userId);
		//return "redirect:/submain/populer.do";
		return "redirect:/main/page.jsp";
	}

}
