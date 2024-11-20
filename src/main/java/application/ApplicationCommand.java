package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class ApplicationCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
    int price = (request.getParameter("totprice") ==null || request.getParameter("totprice").equals("")) ? 0 : Integer.parseInt(request.getParameter("totprice"));
    String area = request.getParameter("selectArea") ==null ? "" : request.getParameter("selectArea");
    int size = (request.getParameter("selectSize") ==null || request.getParameter("selectSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("selectSize"));
    
    
    
    ApplicationVO vo = new ApplicationVO();
    MemberDAO dao = new MemberDAO();
    MemberVO MemberVO = dao.getMemberIdCheck(mid);
    
    String addresses[] = MemberVO.getAddress().split("/");
		String address1 = addresses[0].trim();
		String address2 = addresses[1].trim();
		String address3 = addresses[2].trim();
		String address4 = addresses[3].trim();
    
    
    vo.setPrice(price);
    vo.setArea(area);
    vo.setSize(size);
    
    request.setAttribute("vo", vo);
    request.setAttribute("MemberVO", MemberVO);
    
    request.setAttribute("address1", address1);
		request.setAttribute("address2", address2);
		request.setAttribute("address3", address3);
		request.setAttribute("address4", address4);
		
		
    System.out.println("price AppJsp: " + price);
    System.out.println("area AppJsp: " + area);
    System.out.println("size AppJsp: " + size);
	}
}
