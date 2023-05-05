package handler.comments;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;

public class Write implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if(request.getMethod().equals("GET")){ // 링크 클릭시 -> 코멘트 폼을 보여줘야된다.
			// 작성할 폼 jsp 를 보여줘야함.
			
			// 이 전 페이지(디테일)에서 클릭하면, 무비아이디를 갖고 갈거다. .do?movieNum=아이디
			// double movieNum = Double.parseDouble(request.getParameter("movieNum"));
			
			// 임시로 DB에 1로 하드코딩하여 넣어놓음..
//			double movieNum = 1;
//			
//			
//			ArrayList<CommentsVo> vos = new ArrayList<CommentsVo>();
//			CommentsService service = new CommentsService();
//			//vos = service.showAllCommentsByDate(movieNum);
//			
//			request.setAttribute("vos", vos);
			
			int movieNum = Integer.parseInt(request.getParameter("movieNum"));
			String userId = request.getParameter("userId");
			String comment = request.getParameter("comment");
			String spoiler = request.getParameter("spoiler");
			String num = request.getParameter("num");
			
			CommentsService service = new CommentsService();
			CommentsVo vo = new CommentsVo();
			//vo.setNum(Integer.parseInt(num));
			vo.setMovieNum(movieNum);
			vo.setUserId(userId);
			vo.setComments(comment);
			vo.setSpoiler(spoiler);
			
			service.insert(vo);
			
			return "/comment/commentList.jsp";
		
			
		} else { // POST 방식 (내가 쓴 코멘트 DB 에 저장)
			int movieNum = Integer.parseInt(request.getParameter("movieNum"));
			String userId = request.getParameter("userId");
			String comment = request.getParameter("comment");
			String spoiler = request.getParameter("spoiler");
			String num = request.getParameter("num");
			
			CommentsService service = new CommentsService();
			CommentsVo vo = new CommentsVo();
			//vo.setNum(Integer.parseInt(num));
			vo.setMovieNum(movieNum);
			vo.setUserId(userId);
			vo.setComments(comment);
			vo.setSpoiler(spoiler);
			
			service.insert(vo);
			
			return "/comment/commentList.jsp";
		}
	}

}
