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
		
		String array = "";
		for(String i : sCart) {
			array += i + ",";
		}
		
		array = array.substring(0, array.length()-1);
		
		
		FurnitureDAO dao = new FurnitureDAO();
		
		ArrayList<FurnitureVO> vos = dao.getFurnitureAddCart(array);
		
		request.setAttribute("vos",vos);
		request.setAttribute("sCart", sCart);
	}

}
