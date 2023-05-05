package handler.movie;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import comments.CommentsService;
import handler.Handler;
import star.StarService;
import wish.wishService;
import wish.wishVo;

public class moviedetail implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String movieId = request.getParameter("id");
		int movienum = Integer.parseInt(request.getParameter("id"));
		String userId = (String) request.getSession().getAttribute("userId");

		URL url;

		try {

			url = new URL("https://api.themoviedb.org/3/movie/" + movieId
					+ "?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");

			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));

			String overview = (String) obj.get("overview"); //요약
			
			int runtime = Integer.valueOf(obj.get("runtime").toString()); //런타임

			String title = (String) obj.get("title"); //제목
			String tagline = (String) obj.get("tagline"); //태그라인
			
			Double d = (Double) obj.get("vote_average");
			String formatted = String.format("%.2f", d);
			float vote_average = Float.parseFloat(formatted); //평점 

			String release_date = (String) obj.get("release_date"); //개봉일
		
			
			JSONArray arr = (JSONArray) obj.get("genres"); //장르
			ArrayList<String> name = new ArrayList<>();

			for (int i = 0; i < arr.size(); i++) {
				JSONObject o = (JSONObject) arr.get(i);
				name.add((String) o.get("name"));
			}
			
			JSONArray arr2 = (JSONArray) obj.get("production_companies"); //제작사
			ArrayList<String> production = new ArrayList<>();
			
			for (int j = 0; j < arr2.size(); j++) {
				JSONObject o2 = (JSONObject) arr2.get(j);
				production.add((String) o2.get("name"));
			}

		wishService wservice = new wishService(); 		
        boolean flag = wservice.checkwish(new wishVo(0,userId, movienum));
			
		request.setAttribute("flag", flag); //wish 했니 안했니? 

		
			request.setAttribute("name", name); // 장르
			request.setAttribute("overview", overview); // 요약
			request.setAttribute("runtime", runtime); // 상영시간
			request.setAttribute("title", title); // 제목
			request.setAttribute("tagline", tagline); // 태그라인
			request.setAttribute("vote_average", vote_average); // 평점
			request.setAttribute("movieId", movieId); //영화번호
			request.setAttribute("production", production); //제작사
			request.setAttribute("release_date", release_date); //개봉일
			
			StarService sservice = new StarService(); 
			int star = sservice.starNum(userId,movienum);
			
			double avg = sservice.getAvgStar(movienum);
			String num = String.format("%.2f", avg);
			float staravg = Float.parseFloat(num);
			
			System.out.println(avg);
			String form = String.format("%.2f", avg);
			float avgg = Float.parseFloat(form);
				
			request.setAttribute("star", star); //별이 몇개 있니? 
//			request.setAttribute("avg", avg); //평점 들고 가자 
			request.setAttribute("avg", avgg);
		
			CommentsService cservice = new CommentsService(); 
			String comments = cservice.getComments(userId, movienum);
			
			request.setAttribute("comments", comments); //코멘트 보여줘 
			
			
			
			is.close();
			
			getimg(request, response, movieId);
			
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
		return "/movie/RDetail.jsp";

	}

	public void getimg(HttpServletRequest request, HttpServletResponse response, String movieId) {

		URL url;

		try {
			url = new URL(
					"https://api.themoviedb.org/3/movie/" + movieId + "/images?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6");

			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));

			JSONArray arr = (JSONArray) obj.get("posters");

			JSONObject o = (JSONObject) arr.get(0);
			String file_path = (String) o.get("file_path");

			request.setAttribute("file_path", file_path); // 이미지 포스터 주소
			is.close();

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

}
