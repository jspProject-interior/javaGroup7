package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class approvalChangeCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 999 : Integer.parseInt(request.getParameter("idx"));
		String approval = request.getParameter("approval") == null ? "" :  request.getParameter("approval");
		
		ApplicationDAO dao = new ApplicationDAO();
		int res = dao.setApproval(idx, approval);
		
		
		response.getWriter().write(res + "");
	}

}
