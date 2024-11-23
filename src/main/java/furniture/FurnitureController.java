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
		else if(com.equals("/FurnitureContent")) {
			command = new FurnitureContentCommand();
			command.execute(request, response);
			viewPage += "/furnitureContent.jsp";
		}
		else if(com.equals("/FurnitureInput")) {
			viewPage += "/furnitureInput.jsp";
		}
		else if(com.equals("/FurnitureInputOk")) {
			command = new FurnitureInputCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/interestCheck")) {
			command = new interestCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FurnitureUpdate")) {
			command = new FurnitureUpdateCommand();
			command.execute(request, response);
			viewPage += "/furnitureUpdate.jsp";
		}
		else if(com.equals("/FurnitureUpdateOk")) {
			command = new FurnitureUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FurnitureImgDelete")) {
			command = new FurnitureImgDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FurnitureDelete")) {
			command = new FurnitureDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FurnitureCart")) {
			command = new FurnitureCartCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FurnitureShoppingList")) {
			command = new FurnitureShoppingListCommand();
			command.execute(request, response);
			viewPage += "/furnitureShoppingList.jsp";
		}
		else if(com.equals("/FurnitureBuy")) {
			command = new FurnitureBuyCommand();
			command.execute(request, response);
			viewPage += "/furnitureBuy.jsp";
		}
		else if(com.equals("/FurnitureBuyOk")) {
			command = new FurnitureBuyOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
