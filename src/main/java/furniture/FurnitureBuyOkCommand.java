package furniture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FurnitureBuyOkCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cusMid = request.getParameter("cusMid")==null ? "" : request.getParameter("cusMid");
		String comMid = request.getParameter("comMid")==null ? "" : request.getParameter("comMid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String company = request.getParameter("company")==null ? "" : request.getParameter("company");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String category = request.getParameter("category")==null ? "" : request.getParameter("category");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		int pay = (request.getParameter("cartPay")==null || request.getParameter("cartPay").equals("")) ? 0 : Integer.parseInt(request.getParameter("cartPay"));
		int price = (request.getParameter("cartPrice")==null || request.getParameter("cartPrice").equals("")) ? 0 : Integer.parseInt(request.getParameter("cartPrice"));
		String thumbnail = request.getParameter("thumbnail")==null ? "" : request.getParameter("thumbnail");
		int cnt = (request.getParameter("cnt")==null || request.getParameter("cnt").equals("")) ? 0 : Integer.parseInt(request.getParameter("cnt"));
		int discount = pay - price;
		
		PurchaseVO vo = new PurchaseVO();
		
		vo.setCusMid(cusMid);
		vo.setComMid(comMid);
		vo.setName(name);
		vo.setCompany(company);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setCategory(category);
		vo.setTitle(title);
		vo.setPay(pay);
		vo.setPrice(price);
		vo.setThumbnail(thumbnail);
		vo.setCnt(cnt);
		vo.setDiscount(discount);
		
		PurchaseDAO dao = new PurchaseDAO();
		
		int res = dao.setPurchaseOk(vo);
		
		
		System.out.println("vo : " + vo);
		
		if(res != 0) {
			request.setAttribute("message", "상품이 구매되었습니다.");
			request.setAttribute("url", "Furniture.fu?category=ALL");
		}
		else {
			request.setAttribute("message", "잠시 후 다시 시도해주세요.");
			request.setAttribute("url", "FurnitureBuy.fu");
		}
	

	}

}
