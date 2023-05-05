package handler.comments;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;


/**
 * 댓글목록 전체 보여주기
 * 1. 최상단 : 해당 영화에 내가 단 코멘트 보여주기
 * 2. 하단 탭 1 : 좋아요 많이 받은 순으로 정렬 (스포X)
 * 3. 하단 탭 2 : 최신 순으로 정렬 (스포X)
 * 4. 하단 탭 3 : 스포일러를 최신 순으로 정렬
 * @author gayeong
 *
 */
public class AllList implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		String userId = request.getParameter("userId");
		
		CommentsService service = new CommentsService();
		
		request.setAttribute("movieNum", movieNum);
		request.setAttribute("userId", userId);
		
		// 1. 최상단 : 해당 영화에 내가 단 코멘트 보여주기
		CommentsVo mine = new CommentsVo();
		mine = service.showMyComment(movieNum, userId); 
		if (mine == null) {
			CommentsVo userName = new CommentsVo();
			userName.setUserName("");
			request.setAttribute("mine", userName);
		} else {
			request.setAttribute("mine", mine);
			System.out.println("mine userName : " + mine.getUserName());
		}
		
		
		// 2. 하단 탭 1 : 좋아요 많이 받은 순으로 정렬 (스포X)
		ArrayList<CommentsVo> best = new ArrayList<CommentsVo>();
		best = service.showAllCommentsByRate(movieNum, userId); 
		request.setAttribute("best", best);
		
		// 3. 하단 탭 2 : 최신 순으로 정렬 (스포X)
		ArrayList<CommentsVo> recent = new ArrayList<CommentsVo>();
		recent = service.showAllCommentsByDate(movieNum, userId); 
		request.setAttribute("recent", recent);
		
		// 4. 하단 탭 3 : 스포일러를 최신 순으로 정렬
		ArrayList<CommentsVo> spoiler = new ArrayList<CommentsVo>();
		spoiler = service.showAllCommentsBySpoiler(movieNum, userId); 
		request.setAttribute("spoiler", spoiler);
		
		return "/comment/commentList.jsp";
	}

}
