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

import handler.Handler;
import movie.movieVo;

public class Search implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String text = request.getParameter("query");
		String[] array=text.split("");
		String text2="";
		
		for(int i=0; i<array.length;i++) {
			if(array[i].equals(" ")) {
				text2+="%20";
			}else {
				text2+=array[i];
			}
		}
		System.out.println("검색어 :"+text2);
		
		URL url;
		
		try {
			url = new URL(
					"https://api.themoviedb.org/3/search/movie?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko&query="
					+text2);
			// 웹 주소로 연결
			URLConnection conn = url.openConnection();
			// getInputStream(): 웹페이지에서 데이터를 읽을 수 있눈 스트림 반환
			InputStream is = conn.getInputStream();
			// json 파일 분석할 파서 생성
			JSONParser parser = new JSONParser();
			// 생성한 파서로 json 파일 분석
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
						
			JSONArray arr = (JSONArray) obj.get("results");
						
			ArrayList<movieVo> list = new ArrayList<>();
						
			for(int i=0; i<arr.size(); i++) {
				JSONObject o = (JSONObject) arr.get(i);
				String id = Long.toString((Long) o.get("id"));
				String poster = (String) o.get("poster_path");
				String title = (String) o.get("title");
				String overview = (String) o.get("overview");
				String release_date = (String) o.get("release_date");
				
				
				list.add(new movieVo(id, poster, title, overview, release_date));
			}
			request.setAttribute("searchlist", list);
			request.setAttribute("text", text);
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
		return "/search/search.jsp";
	}

}
