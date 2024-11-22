package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interior.InteriorDAO;
import interior.InteriorVO;

public class FurnitureCartCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx")); 
		
		HttpSession session = request.getSession();
		ArrayList<String> cart = (ArrayList<String>)session.getAttribute("sCart") == null ? null : (ArrayList<String>)session.getAttribute("sCart");
		
		if(cart == null) {
			cart = new ArrayList<String>();
		}
		String tempCart = "cart" + idx;
		
		String res = "0";
		
		if(!cart.contains(tempCart)) {
			res="1";
			cart.add(tempCart);
		}
		
		System.out.println("cart:"+cart);
		
		session.setAttribute("sCart", cart);
		response.getWriter().write(res);
	}

}
