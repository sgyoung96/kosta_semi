package handler.movie;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import handler.Handler;

public class video implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String movieId = request.getParameter("movieId");
		
		URL url;

		try {

			url = new URL("https://api.themoviedb.org/3/movie/" + movieId
					+ "/videos?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");

			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));

			JSONArray arr = (JSONArray) obj.get("results");
						
			if(arr.isEmpty()) {
			    return "/movie/keynull.do?movieId="+movieId;
			}
			
			JSONObject o = (JSONObject) arr.get(0);
			String key = (String) o.get("key");
			
			
			request.setAttribute("key", key);
			request.setAttribute("movieId", movieId);

			is.close();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "/movie/video.jsp";
	}

}
