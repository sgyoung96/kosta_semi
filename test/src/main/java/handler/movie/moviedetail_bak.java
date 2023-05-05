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

public class moviedetail_bak implements Handler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        URL url;
        try {
            url = new URL("https://api.themoviedb.org/3/movie/" + id
                    + "/videos?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");

            URLConnection conn = url.openConnection();

            InputStream is = conn.getInputStream();

            JSONParser parser = new JSONParser();

            JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
            
            JSONArray arr = (JSONArray) obj.get("results");

            // 배열
            ArrayList<movieVo> list = new ArrayList<>();

            for (int i = 0; i < 1; i++) {
                JSONObject o = (JSONObject) arr.get(i);
                String key = (String) o.get("key");
                list.add(new movieVo(key));
            }
            request.setAttribute("movieNum", id);
            request.setAttribute("key", list);

            is.close();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "/movie/detail.jsp";
    }

}
