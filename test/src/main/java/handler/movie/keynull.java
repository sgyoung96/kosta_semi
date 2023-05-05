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

public class keynull implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String movieId = request.getParameter("movieId");
		URL url;

		try {
			url = new URL("https://api.themoviedb.org/3/movie/" + movieId
					+ "/images?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6");

			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));

			JSONArray arr = (JSONArray) obj.get("posters");

			    JSONObject o = (JSONObject) arr.get(0);
			    String file_path = (String) o.get("file_path");
			   			
			request.setAttribute("img_path", file_path);
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
		return "/movie/video.jsp";
	}

	}


