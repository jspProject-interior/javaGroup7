package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import furniture.PurchaseDAO;
import furniture.PurchaseVO;

public class Adjustment implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PurchaseDAO dao = new PurchaseDAO();
		
		ArrayList<PurchaseVO> vos = dao.getUseList();
		
		request.setAttribute("vos", vos);
	}

}
