package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class Password implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		boolean flag = false;
		String password = request.getParameter("password");
		String userId = request.getParameter("userId");
		
		System.out.println("handler:"+password);
		
		MemberService service = new MemberService();
		MemberVo vo = service.getMember(userId);
		
		if(vo != null && password.equals(vo.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId);
			flag = true;
		} 
		
		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		String txt = obj.toJSONString();
		
		return "responsebody/"+txt;
		
	}


}