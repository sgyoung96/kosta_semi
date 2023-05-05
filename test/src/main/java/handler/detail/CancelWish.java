package handler.detail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import handler.Handler;
import wish.wishService;

public class CancelWish implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("여기는 찜 취소구간");
		int movieNum = Integer.parseInt(request.getParameter("movieNum"));
		String userId = request.getParameter("userId");
		System.out.println(movieNum);
		System.out.println(userId);
		wishService wService= new wishService();
		wService.delwish(userId, movieNum);
		return null;
	}
}
