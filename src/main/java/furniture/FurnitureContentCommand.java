package furniture;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FurnitureContentCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		FurnitureVO vo = new FurnitureVO();
		
		FurnitureDAO dao = new FurnitureDAO();
		
		vo = dao.getFurnitureContent(idx);
		ArrayList<FurnitureVO> vos = dao.getFurnitureList("ALL");
		
		HttpSession session = request.getSession();
		
		request.setAttribute("vos", vos);
		request.setAttribute("vo", vo);

	}
}
