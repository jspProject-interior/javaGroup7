package furniture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FurnitureBuyOkCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cusMid = request.getParameter("cusMid")==null ? "" : request.getParameter("cusMid");
		String comMidArr = request.getParameter("comMid")==null ? "" : request.getParameter("comMid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String companyArr = request.getParameter("company")==null ? "" : request.getParameter("company");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String categoryArr = request.getParameter("category")==null ? "" : request.getParameter("category");
		String titleArr = request.getParameter("title")==null ? "" : request.getParameter("title");
		String payArr = request.getParameter("cartPayArr")==null ? "" : request.getParameter("cartPayArr");
		String priceArr = request.getParameter("cartPriceArr")==null ? "" : request.getParameter("cartPriceArr");
		String thumbnailArr = request.getParameter("thumbnail")==null ? "" : request.getParameter("thumbnail");
		int cnt = (request.getParameter("cnt")==null || request.getParameter("cnt").equals("")) ? 1 : Integer.parseInt(request.getParameter("cnt"));
		
		String comMid[] = comMidArr.split(",");
		String company[] = companyArr.split(",");
		String category[] = categoryArr.split(",");
		String title[] = titleArr.split(",");
		String payStr[] = payArr.split(",");
		String priceStr[] = priceArr.split(",");
		String thumbnail[] = thumbnailArr.split(",");
		
		PurchaseDAO dao = new PurchaseDAO();
		
		int pay = 0;
		int price = 0;
		int discount = 0;
		
		int res = 0;
		
		for(int i = 0; i < comMid.length; i++) {
			
			pay = Integer.parseInt(payStr[i]);
			price = Integer.parseInt(priceStr[i]);
			discount = pay - price;
			
			PurchaseVO vo = new PurchaseVO();
			
			vo.setCusMid(cusMid);
			vo.setComMid(comMid[i]);
			vo.setName(name);
			vo.setCompany(company[i]);
			vo.setTel(tel);
			vo.setAddress(address);
			vo.setCategory(category[i]);
			vo.setTitle(title[i]);
			vo.setPay(pay);
			vo.setPrice(price);
			vo.setThumbnail(thumbnail[i]);
			vo.setCnt(cnt);
			vo.setDiscount(discount);
			
			res = dao.setPurchaseOk(vo);
		}
		
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
