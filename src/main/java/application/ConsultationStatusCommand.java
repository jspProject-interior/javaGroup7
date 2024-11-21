package application;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConsultationStatusCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		ApplicationDAO dao = new ApplicationDAO();
		
		
		ArrayList<ApplicationVO> vos = dao.getConsultationStatus(mid);
		
		request.setAttribute("vos", vos);
	}

}
