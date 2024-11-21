package application;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import furniture.FurnitureDAO;
import furniture.FurnitureVO;
import interior.InteriorDAO;
import interior.InteriorVO;

public class MyPostCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String level = (String)request.getAttribute("sLevel");
		
		InteriorDAO InteriorDAO = new InteriorDAO();
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getInteriorPost(mid);
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getFurniturePost(mid);
		
		request.setAttribute("InteriorVOS", InteriorVOS);
		request.setAttribute("FurnitureVOS", FurnitureVOS);
		request.setAttribute("sLevel", level);
	}

}
