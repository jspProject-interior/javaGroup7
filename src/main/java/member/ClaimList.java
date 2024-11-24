package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import furniture.FurnitureDAO;
import furniture.FurnitureVO;
import interior.InteriorDAO;
import interior.InteriorVO;

public class ClaimList implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		InteriorDAO InteriorDAO = new InteriorDAO();
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getMyPostClaim(mid);
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getMyPostClaim(mid);
		
		request.setAttribute("InteriorVOS", InteriorVOS);
		request.setAttribute("FurnitureVOS", FurnitureVOS);
	}
}
