package interior;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InteriorCommand implements InteriorInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("");
		
		InteriorDAO dao = new InteriorDAO();
		
		ArrayList<InteriorVO> vos = dao.getinteriorList();
		
		request.setAttribute("vos", vos);
	}

}
