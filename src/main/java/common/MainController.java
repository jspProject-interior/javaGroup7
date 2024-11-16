package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interior.InteriorDAO;
import interior.InteriorVO;
@WebServlet({"*.main"})
public class MainController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/main/main.jsp";
		
		InteriorDAO inDAO = new InteriorDAO();
		InteriorVO inVO = new InteriorVO();
		
		ArrayList<InteriorVO> inVOS = inDAO.getinteriorList();
		
		request.setAttribute("inVOS", inVOS);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
