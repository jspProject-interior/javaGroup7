package interior;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InteriorContentCommand implements InteriorInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		InteriorVO vo = new InteriorVO();
		
		InteriorDAO dao = new InteriorDAO();
		
		vo = dao.getInteriorContent(idx);
		ArrayList<InteriorVO> vos = dao.getinteriorList("ALL");
		
		request.setAttribute("vos", vos);
		request.setAttribute("vo", vo);
	}
}
