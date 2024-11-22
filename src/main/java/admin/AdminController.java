package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberJoinOkCommand;

@WebServlet("*.ad")
public class AdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/AdminHeader")) {
			viewPage += "/adminHeader.jsp";
		}
		else if(com.equals("/AdminNav")) {
			viewPage += "/adminNav.jsp";
		}
		else if(com.equals("/Admin")) {
			viewPage += "/admin.jsp";
		}
		else if(com.equals("/userList")) {
			command = new userList();
			command.execute(request, response);
			viewPage += "/userList.jsp";
		}
		else if(com.equals("/userList")) {
			command = new userList();
			command.execute(request, response);
			viewPage += "/userList.jsp";
		}
		else if(com.equals("/businessList")) {
			command = new businessList();
			command.execute(request, response);
			viewPage += "/businessList.jsp";
		}
		else if(com.equals("/UserDetail")) {
			command = new UserDetail();
			command.execute(request, response);
			viewPage += "/userDetail.jsp";
		}
		else if(com.equals("/CompanyDetail")) {
			command = new UserDetail();
			command.execute(request, response);
			viewPage += "/companyDetail.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
