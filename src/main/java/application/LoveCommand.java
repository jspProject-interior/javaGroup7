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

public class LoveCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<String> sContentGood = (ArrayList<String>)session.getAttribute("sContentGood") == null ? null : (ArrayList<String>)session.getAttribute("sContentGood");
    if (sContentGood == null) {
    	sContentGood = new ArrayList<>();
    }
		
		InteriorDAO InteriorDAO = new InteriorDAO();
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getInteriorIdxSearch(request);
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getFurnitureIdxSearch(request);
		
		request.setAttribute("InteriorVOS", InteriorVOS);
		request.setAttribute("FurnitureVOS", FurnitureVOS);
		request.setAttribute("sContentGood", sContentGood);
	}

}
