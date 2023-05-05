package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class EditLine implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		if(request.getMethod().equals("GET")) {
			
		} else {
			String userId = request.getParameter("userId");
			String introLine = request.getParameter("introLine");
			MemberService service = new MemberService();
			System.out.println("userId :"+userId+" / introLine :"+introLine);
			service.lineInsert(userId, introLine);
			MemberVo vo = service.getMember(userId);		
						
			return "responsebody/" + introLine;
		}
		return null;
	}

}
