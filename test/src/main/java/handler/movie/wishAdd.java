package handler.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import wish.wishService;
import wish.wishVo;


public class wishAdd implements Handler {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) {
      
	   if (request.getMethod().equals("GET")) {
            	  
         String userId = request.getParameter("userId");
         System.out.println(userId);
         int movieId=Integer.parseInt(request.getParameter("movieId"));
         
         wishService service = new wishService();
         boolean flag = service.checkwish(new wishVo(0,userId, movieId));
       
         if(flag) {
            service.delwish(userId, movieId);
            
         }else {
            service.addwish(new wishVo(0,userId, movieId));
         }
       
         System.out.println("wishAdd핸들러 : " + flag);
         return "/movie/RDetail.jsp";
      }
     
      return null;
      
   }

}