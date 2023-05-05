package handler.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;

public class RateUpdate implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		if(request.getMethod().equals("GET")){
			return "";
		} else { // POST
			
			String userId = request.getParameter("userId");
			int movieNum = Integer.parseInt(request.getParameter("movieNum"));
			//int commentId = Integer.parseInt(request.getParameter("commentId"));
			
			CommentsService service = new CommentsService();
			CommentsVo vo = new CommentsVo();
			vo.setUserId(userId);
			vo.setMovieNum(movieNum);
			//vo.setNum(commentId);
			//vo.setRate(rate);
			
			CommentsVo result = new CommentsVo();
			result = service.setRate(vo);
			
			//return "/comment/commentList.jsp";
			return  "responsebody/" + result.getRate();
		}
	}

}
