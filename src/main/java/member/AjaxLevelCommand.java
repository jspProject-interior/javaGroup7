package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxLevelCommand implements MemberInterface {
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ALevel = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 999 : Integer.parseInt(request.getParameter("level"));
		int level = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 999 : Integer.parseInt(request.getParameter("level"));
		System.out.println("Alevel" + ALevel);
		request.setAttribute("level", ALevel);
		if(ALevel==1) {
			request.getRequestDispatcher("/include/customerForm.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/include/companyForm.jsp").forward(request, response);
		}
	}
}
