package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApplicationCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String price = request.getParameter("totprice") ==null ? "" : request.getParameter("totprice");
		String area = request.getParameter("area") ==null ? "" : request.getParameter("area");
		
		ApplicationVO vo = new ApplicationVO();
		
		System.out.println("priceCommand : "+ price);
		System.out.println("areaCommand : "+ area);
		
		response.getWriter().println("priceRespon" + price);
	}

}
