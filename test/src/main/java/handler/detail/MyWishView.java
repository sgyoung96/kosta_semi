package handler.detail;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import follow.followVo;
import handler.Handler;
import movie.movieVo;
import wish.wishService;
import wish.wishVo;

public class MyWishView implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		String userId = request.getParameter("userId");
		wishService wService = new wishService();
		
		ArrayList<wishVo> wList= wService.getWishList(userId);
		request.setAttribute("wList", wList);
		ArrayList<movieVo> wImgList=new ArrayList<movieVo>();
		
		for(int i=0;i<wList.size();i++) {
			
			String movieNum = Integer.toString(wList.get(i).getMovieNum());
			try {
				URL url = new URL("https://api.themoviedb.org/3/movie/"+movieNum+"?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");
				URLConnection conn = url.openConnection();
				InputStream is = conn.getInputStream();
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
				System.out.println(obj);
				System.out.println(url);
				String title = (String) obj.get("title");
				String poster_path = (String) obj.get("poster_path");
				System.out.println("포스터사진 빈값 확인"+poster_path.length()+" / "+poster_path);
				String filePath = "https://image.tmdb.org/t/p/original" + poster_path;
				wImgList.add(new movieVo(movieNum, filePath, title, ""));				
				
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("wImgList", wImgList);
		
		return "/detail/myWishList.jsp";
	}

}
