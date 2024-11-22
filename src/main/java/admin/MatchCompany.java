package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import application.ApplicationDAO;

public class MatchCompany implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String companyId = request.getParameter("companyId") == null ? "" : request.getParameter("companyId");
		String companyName = request.getParameter("companyName") == null ? "" : request.getParameter("companyName");
		
		ApplicationDAO dao = new ApplicationDAO();
		
		String res = dao.MatchCompany(mid, companyId, companyName)+"";
		
		response.getWriter().write(res);
	}
}
