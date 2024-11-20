package furniture;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.fu")
public class FurnitureController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FurnitureInterface command = null;
		String viewPage = "/WEB-INF/furniture";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/Furniture")) {
			command = new FurnitureCommand();
			command.execute(request, response);
			viewPage += "/furniture.jsp";
		}
		else if(level > 3) {
			request.setAttribute("message", "로그인 후 사용 가능합니다.");
			request.setAttribute("url", "/main.main");
			viewPage = "/include/message.jsp";
		}
		/*
		else if(com.equals("/InteriorContent")) {
			command = new InteriorContentCommand();
			command.execute(request, response);
			viewPage += "/interiorContent.jsp";
		}
		else if(com.equals("/InteriorInput")) {
			viewPage += "/interiorInput.jsp";
		}
		else if(com.equals("/InteriorInputOk")) {
			command = new InteriorInputCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/InteriorUpdate")) {
			command = new InteriorUpdateCommand();
			command.execute(request, response);
			viewPage += "/interiorUpdate.jsp";
		}
		else if(com.equals("/InteriorUpdateOk")) {
			command = new InteriorUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/interirorImgDelete")) {
			command = new interirorImgDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/InteriorDelete")) {
			command = new InteriorDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/interestCheck")) {
			command = new interestCheckCommand();
			command.execute(request, response);
			return;
		}
	*/	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
