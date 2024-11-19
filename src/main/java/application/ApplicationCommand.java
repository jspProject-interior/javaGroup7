package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ApplicationCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
    int price = (request.getParameter("totprice") ==null || request.getParameter("totprice").equals("")) ? 0 : Integer.parseInt(request.getParameter("totprice"));
    String area = request.getParameter("selectArea") ==null ? "" : request.getParameter("selectArea");
    int size = (request.getParameter("selectSize") ==null || request.getParameter("selectSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("selectSize"));

    ApplicationVO vo = new ApplicationVO();
    
    vo.setPrice(price);
    vo.setArea(area);
    vo.setSize(size);
    
    System.out.println("price AppJsp: " + price);
    System.out.println("area AppJsp: " + area);
    System.out.println("size AppJsp: " + size);
	}
}
