package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import furniture.FurnitureDAO;
import furniture.FurnitureVO;
import interior.InteriorDAO;
import interior.InteriorVO;

public class ClaimList implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		InteriorDAO InteriorDAO = new InteriorDAO();
		
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getClaimList();
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getClaimList();
		
		request.setAttribute("FurnitureVOS", FurnitureVOS);
		request.setAttribute("InteriorVOS", InteriorVOS);
	}

}
