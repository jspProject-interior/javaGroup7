package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import application.ApplicationDAO;
import application.ApplicationVO;
import furniture.FurnitureDAO;
import furniture.FurnitureVO;
import furniture.PurchaseDAO;
import interior.InteriorDAO;
import interior.InteriorVO;

public class MyPageCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		MemberDAO dao = new MemberDAO();
		InteriorDAO InteriorDAO = new InteriorDAO();
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		ApplicationDAO ApplicationDAO = new ApplicationDAO();
		PurchaseDAO PurchaseDAO = new PurchaseDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		int interiorPostCnt = InteriorDAO.getInteriorPost(mid).size(); 
		int furniturePostCnt = FurnitureDAO.getFurniturePost(mid).size(); 
		
		int counselListCnt = ApplicationDAO.getCounselList(mid).size();
		
		int BuyListCnt = PurchaseDAO.getBuyList(mid).size();
		int SellListCnt = PurchaseDAO.getSellList(mid).size();
		
		ArrayList<String> cart = (ArrayList<String>)session.getAttribute("sCart");
    if (cart == null) {
      cart = new ArrayList<>();
    }
		
		request.setAttribute("vo", vo);
		request.setAttribute("counselListCnt", counselListCnt);
		request.setAttribute("interiorPostCnt", interiorPostCnt);
		request.setAttribute("furniturePostCnt", furniturePostCnt);
		request.setAttribute("BuyListCnt", BuyListCnt);
		request.setAttribute("SellListCnt", SellListCnt);
		request.setAttribute("cartCnt", cart.size());
	}
}
