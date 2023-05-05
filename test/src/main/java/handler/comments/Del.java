package handler.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;

public class Del implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		if(request.getMethod().equals("GET")){ // 링크 클릭시 -> 코멘트 폼을 보여줘야된다.
			return "";
		} else {
			
			int movieNum = Integer.parseInt(request.getParameter("movieNum"));
			String userId = request.getParameter("userId");
			
			CommentsService service = new CommentsService();
			CommentsVo vo = new CommentsVo();
			vo.setMovieNum(movieNum);
			vo.setUserId(userId);
			
			service.delete(vo);
			
			return "/comment/commentList.jsp";
		}
	}

}
