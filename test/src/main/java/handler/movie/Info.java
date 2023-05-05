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

public class Info implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		
		URL url; 
		
		try {
			
			url = new URL("https://api.themoviedb.org/3/movie/" + id + 
					"?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");
		
		URLConnection conn = url.openConnection();
		InputStream is = conn.getInputStream();
		JSONParser parser = new JSONParser(); 
		JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
		
		String overview = (String) obj.get("overview");
				
		int runtime  = Integer.valueOf(obj.get("runtime").toString());

		String title=(String) obj.get("title");
		String tagline=(String) obj.get("tagline");
		String production=(String) obj.get("name");
		
		JSONArray arr = (JSONArray) obj.get("genres");
		ArrayList <String> name = new ArrayList<>();
		
		for (int i=0; i<arr.size(); i++) {
			JSONObject o = (JSONObject) arr.get(i);
			name.add((String) o.get("name"));
		}
				
		request.setAttribute("name", name);
		request.setAttribute("overview", overview);
		request.setAttribute("runtime", runtime);
		request.setAttribute("title", title);
		request.setAttribute("tagline", tagline);
		request.setAttribute("production", production);
		
		
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
		
		return "/movie/detail.jsp";
	}

}
