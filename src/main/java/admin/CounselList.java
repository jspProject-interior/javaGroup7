package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import application.ApplicationDAO;
import application.ApplicationVO;

public class CounselList implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ApplicationVO> vos = new ArrayList<ApplicationVO>();
		
		ApplicationDAO dao = new ApplicationDAO();
		
		vos = dao.getConsultationStatus("전체");
		
		request.setAttribute("vos", vos);
	}
}
