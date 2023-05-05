package handler.follow;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import follow.followService;
import follow.followVo;
import handler.Handler;

public class Add implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getMethod().equals("GET")) {
			
		} else {
			String userId = request.getParameter("userId");
			String followedId = request.getParameter("followedId");
			
			followService service = new followService();
			
			boolean flag = service.checkfollow(new followVo(userId, followedId));
			System.out.println(flag);
			
			if(flag) {
				service.delFollow(new followVo(userId, followedId));
				
			} else {
				service.follow(new followVo(userId, followedId));
			}
			return "/member/otherUser.jsp";
		}
		return null;
		
	}

}
