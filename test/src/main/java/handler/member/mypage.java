package handler.member;

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
import comments.CommentsVo;
import follow.followService;
import follow.followVo;
import handler.Handler;
import member.MemberService;
import member.MemberVo;
import movie.movieVo;
import star.StarService;
import star.StarVo;
import wish.wishService;
import wish.wishVo;

public class mypage implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getMethod().equals("GET")) {
			String userId = request.getParameter("userId");

			StarService starService = new StarService();
			wishService wService = new wishService();

			// 한 줄 소개
			MemberService memberService = new MemberService();
			MemberVo vo = memberService.getMember(userId);
			request.setAttribute("vo", vo);

			// 팔로우 팔로잉 숫자
			followService followService = new followService();
			int fCount = followService.followedIdCount(userId); // 팔로워수
			int uCount = followService.userIdCount(userId); // 팔로잉수
			request.setAttribute("fCount", fCount);
			request.setAttribute("uCount", uCount);

			// 찜 리스트
			ArrayList<wishVo> wishList = wService.getWishList(userId);
			ArrayList<movieVo> wishImageList = new ArrayList<movieVo>();

			int max = 7; // 한 줄에 총 보여질 개수
			int size = 0;
			if (wishList.size() <= max) {
				size = wishList.size();
			} else {
				size = max;
			}

			for (int i = 0; i < size; i++) {
				String movieNum = Integer.toString(wishList.get(i).getMovieNum());
				try {
					URL url = new URL("https://api.themoviedb.org/3/movie/" + movieNum
							+ "?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");
					URLConnection conn = url.openConnection();
					InputStream is = conn.getInputStream();
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
					String title = (String) obj.get("title");
					String poster_path = (String) obj.get("poster_path");
					String filePath = "https://image.tmdb.org/t/p/original" + poster_path;

					if (poster_path != null) {
						wishImageList.add(new movieVo(movieNum, filePath, "", ""));
					} else {
						filePath = request.getContextPath() + "/image/No_image.png";
						wishImageList.add(new movieVo(movieNum, filePath, title, ""));
					}

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
			request.setAttribute("wishImageList", wishImageList);
			// 여기

			// 별점 리스트
			ArrayList<StarVo> starList = starService.getStarList(userId);
			ArrayList<movieVo> starImageList = new ArrayList<movieVo>();

			size = 0;
			if (starList.size() <= max) {
				size = starList.size();
			} else {
				size = max;
			}

			for (int i = 0; i < size; i++) {
				String movieNum = Integer.toString(starList.get(i).getMovieNum());
				try {
					URL url = new URL("https://api.themoviedb.org/3/movie/" + movieNum
							+ "?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");
					URLConnection conn = url.openConnection();
					InputStream is = conn.getInputStream();
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
					String title = (String) obj.get("title");
					String poster_path = (String) obj.get("poster_path");
					String filePath = "https://image.tmdb.org/t/p/original" + poster_path;

					if (poster_path != null) {
						starImageList.add(new movieVo(movieNum, filePath, "", ""));
					} else {
						filePath = request.getContextPath() + "/image/No_image.png";
						starImageList.add(new movieVo(movieNum, filePath, title, ""));
					}

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
			request.setAttribute("starImageList", starImageList);

			// 코멘트 리스트
			CommentsService commentsService = new CommentsService();
			ArrayList<CommentsVo> commentsList = commentsService.showMyComments(userId);
			request.setAttribute("commentsList", commentsList);
			ArrayList<movieVo> commentsImageList = new ArrayList<movieVo>();

			size = 0;
			if (commentsList.size() <= max) {
				size = commentsList.size();
			} else {
				size = max;
			}

			for (int i = 0; i < size; i++) {
				String movieNum = String.valueOf(commentsList.get(i).getMovieNum());
				try {
					URL url = new URL("https://api.themoviedb.org/3/movie/" + movieNum
							+ "?api_key=c8a3d049a6a74a627e4a2fa5bfd674f6&language=ko");
					URLConnection conn = url.openConnection();
					InputStream is = conn.getInputStream();
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(new InputStreamReader(is));
					String title = (String) obj.get("title");
					String poster_path = (String) obj.get("poster_path");
					String filePath = "https://image.tmdb.org/t/p/original" + poster_path;

					if (poster_path != null) {
						commentsImageList.add(new movieVo(movieNum, filePath, "", ""));
					} else {
						filePath = request.getContextPath() + "/image/No_image.png";
						commentsImageList.add(new movieVo(movieNum, filePath, title, ""));
					}

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
			request.setAttribute("commentsImageList", commentsImageList);
			request.setAttribute("view", "/member/mypage.jsp");
			ArrayList<followVo> FollowingList = new ArrayList<followVo>();
			followService americano = new followService();
			FollowingList = americano.Allfollower(userId);
			request.setAttribute("americano", FollowingList);
			System.out.println(americano);
			
			return "/member/mypage.jsp";
		}

		
		return null;
	}

}
