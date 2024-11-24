package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BuyListCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		PurchaseDAO dao = new PurchaseDAO();
		
		ArrayList<PurchaseVO> vos = dao.getBuyList(mid);
		
		request.setAttribute("vos", vos);

	}

}
