package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class ApplicationOkCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null? "" : request.getParameter("mid");
		String name = request.getParameter("name") == null? "" : request.getParameter("name");
		String conAddress = request.getParameter("conAddress") == null? "" : request.getParameter("conAddress");
		String tel = request.getParameter("tel") == null? "" : request.getParameter("tel");
		String category = request.getParameter("category") == null? "" : request.getParameter("category");
		int price = (request.getParameter("price") == null || request.getParameter("price").equals("")) ? 0 : Integer.parseInt(request.getParameter("price"));
		int budget = (request.getParameter("budget") == null || request.getParameter("budget").equals("")) ? 0 : Integer.parseInt(request.getParameter("budget"));
		int size = (request.getParameter("size") == null || request.getParameter("size").equals("")) ? 0 : Integer.parseInt(request.getParameter("size"));
		String conStartDay = request.getParameter("conStartDay") == null? "" : request.getParameter("conStartDay");
		String area = request.getParameter("area") == null? "" : request.getParameter("area");
		String companyMid = request.getParameter("companyMid") ==null ? "" : request.getParameter("companyMid");
		ApplicationDAO dao = new ApplicationDAO();
		MemberDAO MemberDAO = new MemberDAO(); 
		MemberVO MemberVO =  MemberDAO.getMemberIdCheck(companyMid);
		
		ApplicationVO vo = new ApplicationVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setConAddress(conAddress);
		vo.setTel(tel);
		vo.setCategory(category);
		vo.setPrice(price);
		vo.setBudget(budget);
		vo.setSize(size);
		vo.setConStartDay(conStartDay);
		vo.setArea(area);
		vo.setCompanyMid(companyMid);
		vo.setCompanyName(MemberVO.getCompany());
		
		int res = dao.setApplicationOk(vo);
	
		if(res != 0) {
			request.setAttribute("message", "상담신청이 완료되었습니다.");
			request.setAttribute("url", "main.main");
		}
		else {
			request.setAttribute("message", "잠시 후 다시 시도해주세요.");
			request.setAttribute("url", "Application.ap");
		}
		

	}

}
