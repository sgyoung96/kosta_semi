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

public class findgenre implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String genrenum = request.getParameter("id");
		System.out.println(genrenum);
		
		URL url; 
		
		try {
			url=new URL (
					"https://api.themoviedb.org/3/discover/movie?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=" + genrenum
					);
			
			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			JSONParser parser = new JSONParser(); 
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
			
			JSONArray arr = (JSONArray) obj.get("results");

			ArrayList<movieVo> list = new ArrayList<>();

			for (int i = 0; i < arr.size(); i++) {
				JSONObject o = (JSONObject) arr.get(i);
				String id = Long.toString((Long) o.get("id")); //영화아이디
				String poster = (String) o.get("poster_path"); //포스터경로
				String title = (String) o.get("title"); //제목 

				list.add(new movieVo(id, poster, title));
			}
			request.setAttribute("movielist", list);
			request.setAttribute("genrenum", genrenum);

			is.close();
			
			getgenre(request,response);

			
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
		
		
		return "/submain/genre.jsp";
	}

	public void getgenre(HttpServletRequest request, HttpServletResponse response) {
		URL url;
		
		try {
			url = new URL("https://api.themoviedb.org/3/genre/movie/list?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");
		
			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream() ;
			JSONParser parser = new JSONParser(); 
			JSONObject obj = (JSONObject)parser.parse(new InputStreamReader(is));
			
			JSONArray arr = (JSONArray) obj.get("genres");
			
			ArrayList<movieVo> genre = new ArrayList<>();
			
			for (int i =0; i<arr.size(); i++) {
			JSONObject o = (JSONObject) arr.get(i);
			String id = Long.toString((Long) o.get("id"));
			String genreko = (String) o.get("name");
			
			 genre.add(new movieVo(id,genreko));
			}
			
			request.setAttribute("genrename", genre); 
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
