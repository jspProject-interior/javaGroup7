package interior;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InteriorCommand implements InteriorInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category") == null ? "ALL" : request.getParameter("category");
		InteriorDAO dao = new InteriorDAO();
		
		ArrayList<InteriorVO> vos = dao.getinteriorList(category);
		
		request.setAttribute("vos", vos);
	}

}
