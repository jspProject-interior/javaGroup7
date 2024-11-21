package application;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CounselListCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null? "" : request.getParameter("mid");
		
		ApplicationDAO dao = new ApplicationDAO();
		ArrayList<ApplicationVO> vos = dao.getCounselList(mid);

		request.setAttribute("mid", mid);
		request.setAttribute("vos", vos);
	}

}
