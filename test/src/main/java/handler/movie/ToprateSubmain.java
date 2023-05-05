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

public class ToprateSubmain implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		//평점순
		URL url;
		
		try {
			url = new URL(
					"https://api.themoviedb.org/3/movie/top_rated?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko&page=1");
			//웹 주소로 연결
			URLConnection conn = url.openConnection();
			//getInputStream(): 웹페이지에서 데이터를 읽을 수 있는 스트림
			InputStream is = conn.getInputStream();
			
			JSONParser parser = new JSONParser();
			
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
			JSONArray arr = (JSONArray) obj.get("results");
			ArrayList<movieVo> list = new ArrayList<>();
			for(int i=0; i<arr.size(); i++) {
				JSONObject o = (JSONObject) arr.get(i);
				String id = Long.toString((Long) o.get("id"));
				String poster = (String) o.get("poster_path");
				String title = (String) o.get("title");
				list.add(new movieVo(id, poster, title));
			}
			request.setAttribute("topratelist", list);
			request.setAttribute("prev", num-1);
			request.setAttribute("next", num+1);
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
		
		
		return "/submain/toprate.jsp";
	}

}
