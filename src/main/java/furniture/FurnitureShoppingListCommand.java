package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FurnitureShoppingListCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<String> sCart = (ArrayList<String>)session.getAttribute("sCart");
		
		FurnitureDAO dao = new FurnitureDAO();
		
		ArrayList<FurnitureVO> vos = dao.getFurnitureAddCart(request);
		
		request.setAttribute("vos",vos);
		request.setAttribute("sCart", sCart);
	}

}
