package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interior.InteriorDAO;
import interior.InteriorVO;

public class FurnitureShoppingListCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<String> sCart = (ArrayList<String>)session.getAttribute("sCart") == null ? null : (ArrayList<String>)session.getAttribute("sCart");
		
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getFurnitureAddCart(request);
		
		request.setAttribute("FurnitureVOS", FurnitureVOS);
		request.setAttribute("sCart", sCart);

	}

}
