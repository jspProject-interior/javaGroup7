package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxLevelCommand implements MemberInterface {
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ALevel = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 0 : Integer.parseInt(request.getParameter("level"));
		
		
		request.setAttribute("level", ALevel);
		request.getRequestDispatcher("/include/customerForm.jsp").forward(request, response);
	}
}
