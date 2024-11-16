package interior;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.in")
public class InteriorController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InteriorInterface command = null;
		String viewPage = "/WEB-INF/interior";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/Interior")) {
			command = new InteriorCommand();
			command.execute(request, response);
			viewPage += "/interior.jsp";
		}
		else if(com.equals("/InteriorInput")) {
			viewPage += "/interiorInput.jsp";
		}
		else if(com.equals("/InteriorInputOk")) {
			command = new InteriorInputCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/InteriorContent")) {
			command = new InteriorContentCommand();
			command.execute(request, response);
			viewPage += "/interiorContent.jsp";
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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
