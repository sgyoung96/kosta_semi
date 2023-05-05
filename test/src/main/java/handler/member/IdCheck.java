package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class IdCheck implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String txt = "";
		if(request.getMethod().equals("GET")) {
			String userId = request.getParameter("userId");
			System.out.println("idCheck : userId"+userId);
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(userId);
			System.out.println("idCheck 의 vo:"+vo);
			boolean flag =(vo==null);
			JSONObject obj = new JSONObject();
			obj.put("flag", flag);
			txt = obj.toJSONString();
		}
		return "responsebody/"+txt;
	}

}
