package req;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;

/**
 * Servlet implementation class DispatcherServlet  
 * //DispatcherServlet : Http프로토콜로 들어오는 모든 요청을 가장 먼저 받아 적합한 컨트롤러에 위임해주는 Front Controller프론트 컨트롤러
 */
@WebServlet("*.do")  //뷰 페이지의 직접적인 모든 요청을 받는 페이지
//* = 모든 것을 의미해서, url이 .do로 끝나는 모든 요청을 받도록 하기 위해
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//commands.properties 파일의 url과 명령어를 읽어서 저장할 map
	private Map<String, Handler> map = new HashMap<>();
	
    //init() : 서블릿 생성 시, 딱 한번만 실행되는 메서드(파일의 내용이 변경되지 않는 이상 바뀔 일이 없기 때문에)
    @Override
	public void init() throws ServletException {
    	Properties prop = new Properties();
    	
    	//getRealPath : 파라메터로 지정한 경로를 웹에서 사용하는 실제 경로로 변환해주는 메서드
    	String path = this.getServletContext().getRealPath("/WEB-INF/commands.properties");
    	try {
    		//commands.properties 파일의 키, 값을 load해서 prop에 저장하는 것
    		//저장하면 Properties prop = new Properties();의 prop에 저장됨
			prop.load(new FileReader(path));
			Iterator iter = prop.keySet().iterator();
			
			while(iter.hasNext()) {
				String url = (String) iter.next();  //url =/member/join.do
				String className = prop.getProperty(url);  //handler.member.JoinHandler
				System.out.println(url + " / " + className);
				
				try {
					//Class : 클래스에 대한 정보를 갖는 클래스. 클래스이름. 멤버변수이름, 멤버변수이름/타입, 메서드 이름/프로토타입에 대한 정보 갖음
					//지정한 클래스 정보를 갖는 Class 객체 반환
					Class<?> handlerClass = Class.forName(className);
					
					//지정한 클래스의 객체를 생성할 생성자 반환
					Constructor<?> cons = handlerClass.getConstructor(null);
					
					//handler 객체 생성
					Handler handler = (Handler) cons.newInstance();
					
					//위의 세 줄은 Handler handler = new JoinHandler(); 이 한 줄과 같은 코드
					
					//생성한 handler 객체를 url과 같이 map에 저장
					map.put(url, handler);
					
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
				


	/**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
    	
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//서블릿으로 온 요청을 처리한 뒤 뷰페이지로 이동(항상 같은 패턴)
		String url = request.getServletPath();  //요청이 왔을 때, 기본url값을 꺼낸 것
		//getServletPath() : 사용자가 방금 요청한 url값을 반환하는 메서드 
		
		String view = null;
		
		Handler handler = map.get(url);  
		//인터페이스 타입으로 handler타입의 변수 선언 ---> 업캐스팅(여러 타입의 변수를 다 담을 수 있어야 하니까)
		
		if(handler != null) {  
			view = handler.process(request, response);
			if(view != null) {
				
				if(view.startsWith("redirect")) {  //받은 뷰페이지 경로가, redirect로 실행된다면
					String[] path = view.split(":");  //view.split(":")한 값을 path배열에 넣어라
					System.out.println(request.getContextPath() + path[1]);
					response.sendRedirect(request.getContextPath() + path[1]);
				} else if (view.startsWith("responsebody")) {
					String[] path = view.split("/");
					System.out.println(path[1]);
					response.getWriter().append(path[1]);  //출력 : {flag:true} 이런 형태로 출력됨
				} else {	
					RequestDispatcher dis = request.getRequestDispatcher(view);
					dis.forward(request, response);		
				}
			}
		} else {  //handler = null이면
			response.getWriter().append("404 not found url");
		}
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}


}