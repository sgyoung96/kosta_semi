package handler.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import star.StarService;
import star.StarVo;

public class addstar implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		if (request.getMethod().equals("GET")) {
		
			String userId = request.getParameter("userId");
			int movieId = Integer.parseInt(request.getParameter("movieId"));
			int value = Integer.parseInt(request.getParameter("value"));

			StarService service = new StarService();
			boolean star = service.checkstar(new StarVo(0,userId,movieId,0)); //
			
			System.out.println(star);
			
			if(star) { //별이 트루라면 
				service.updateStar(new StarVo(0,userId,movieId,value));
			} else {
			
			service.starInsert(new StarVo(0, userId, movieId, value));
			
			}

			return "/movie/RDetail.jsp";
		}

		return null;
	}
}
