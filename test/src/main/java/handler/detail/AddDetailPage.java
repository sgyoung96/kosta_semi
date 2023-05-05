package handler.detail;

import java.security.Provider.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;

public class AddDetailPage implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

	      if (request.getMethod().equals("GET")) {
	            
	          int movieNum = Integer.parseInt(request.getParameter("movieId"));
	          String userId = request.getParameter("userId");
	          String comment = request.getParameter("comment");
	          String spoiler = request.getParameter("isSpolier");
	          
	          CommentsService service = new CommentsService();
	          
	          service.insert(new CommentsVo(movieNum, userId, comment, spoiler));
	          
	          return "responseody/" + comment;
	       }
	       
	       return "";
	    }
	}
