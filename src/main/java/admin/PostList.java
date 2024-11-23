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

public class PostList implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		InteriorDAO InteriorDAO = new InteriorDAO();
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getInteriorPost("전체");
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getFurniturePost("전체");
		
		request.setAttribute("InteriorVOS", InteriorVOS);
		request.setAttribute("FurnitureVOS", FurnitureVOS);
	}
}
