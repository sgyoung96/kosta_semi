package handler.detail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;

public class editdel implements Handler {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) {
      
      
      int movieNum = Integer.parseInt(request.getParameter("movieId"));
      String userId = request.getParameter("userId");
      String comment = request.getParameter("comment");
      String spoiler = request.getParameter("isSpolier");
      
      CommentsService service = new CommentsService();
   
      if (request.getMethod().equals("GET")) { //get방식으로 오면 수정 
         
         
         service.updateComments(new CommentsVo(comment, spoiler,userId,movieNum));
         
         return "/movie/RDetail.jsp";

      } else { //post 방식으로 오면 삭제 
         
         service.delete(new CommentsVo (movieNum, userId)); 
      }
      return "/movie/RDetail.jsp";
      }

}