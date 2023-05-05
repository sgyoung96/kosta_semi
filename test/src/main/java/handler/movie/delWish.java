package handler.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import wish.wishService;
import wish.wishVo;

public class delWish implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

        if (request.getMethod().equals("GET")) {
			JSONObject json = new JSONObject();
			return json.toJSONString();
        } else {
        
        	int movieId = Integer.parseInt(request.getParameter("movieNum"));
            String userId = request.getParameter("userId"); 
               
            wishService service = new wishService();  
       
            wishVo vo = new wishVo();
            
            vo.setUserId(userId);
            vo.setMovieNum(movieId);
            
            service.delwish(vo.getUserId(),vo.getMovieNum());
  
        } 
        
     return "movie/RDtail.jsp";
	}

}
