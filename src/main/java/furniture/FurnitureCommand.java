package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interior.InteriorDAO;
import interior.InteriorVO;

public class FurnitureCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category") == null ? "ALL" : request.getParameter("category");
		FurnitureDAO dao = new FurnitureDAO();
		
		ArrayList<FurnitureVO> vos = dao.getFurnitureList(category);
		
		request.setAttribute("vos", vos);
	}

}
