package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CounselListDetailCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		ApplicationDAO dao = new ApplicationDAO();
		ApplicationVO vo = dao.getUserInfo(mid);

		
		request.setAttribute("vo", vo);
	}
}
