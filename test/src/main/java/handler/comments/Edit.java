package handler.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import comments.CommentsService;
import comments.CommentsVo;
import handler.Handler;

public class Edit implements Handler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		if(request.getMethod().equals("GET")){
			JSONObject json = new JSONObject();
			return json.toJSONString();
		} else { // POST
			//String userId = request.getParameter("userId");
			int num = Integer.parseInt(request.getParameter("num"));
			int movieNum = Integer.parseInt(request.getParameter("movieNum"));
			//String userId = request.getParameter("userId");
			String userId = request.getParameter("userId");
			String comment = request.getParameter("comment");
			String spoiler = request.getParameter("spoiler");
			
			CommentsService service = new CommentsService();
			CommentsVo vo = new CommentsVo();
			vo.setNum(num);
			vo.setMovieNum(movieNum);
			vo.setUserId(userId);
			vo.setComments(comment);
			vo.setSpoiler(spoiler);
			
			CommentsVo vo2 = new CommentsVo();
			vo2 = service.update(vo);
			JSONObject json = new JSONObject();
			json.put("num", vo2.getNum());
			json.put("movieNum", vo2.getMovieNum());
			json.put("userId", vo2.getUserId());
			json.put("comments", vo2.getComments());
			json.put("w_Date", vo2.getW_Date()+"");
			json.put("rate", vo2.getRate());
			json.put("spoiler", vo2.getSpoiler());
			json.put("name", vo2.getUserName());
			
			System.out.println(vo2.toString());
			
			//String txt = (String) json.toJSONString();
			System.out.println("json: " + json.toJSONString());
			
			//return "responsebody/" + txt;
			return "/comment/commentList.jsp";
		}
		
	}

}