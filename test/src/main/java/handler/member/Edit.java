package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class Edit implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		MemberService service = new MemberService();

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		if (request.getMethod().equals("GET")) {
			request.setAttribute("edit", "/member/edit.jsp");
			String userId = request.getParameter("userId");
			//String userId = "mango"; // 임의로 넣은 줄
			MemberVo vo = service.getMember(userId);
			request.setAttribute("vo", vo);
			System.out.println("Edit의 GET");
			//return "/member/mypage.jsp";
			return "/member/edit.jsp";
		} else {
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String nickname = request.getParameter("nickname");
			System.out.println("password :" + password + " / nickname : " + nickname);

			service.editMyInfo(new MemberVo(userId, password, nickname, ""));
			request.setAttribute("view", "/member/edit.do?userId=" + userId);
			
			JSONObject obj = new JSONObject();
			obj.put("password", password);
			obj.put("nickname", nickname);
			
			String txt = obj.toJSONString();
			return "responsebody/" + txt;
		}

		//return "메인페이지로 이동";
	}

}
