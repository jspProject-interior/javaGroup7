package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class FurnitureBuyCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String idxArray = request.getParameter("idxArray")==null ? "" : request.getParameter("idxArray");
		System.out.println("command : " + idxArray);
		MemberDAO MemberDAO = new MemberDAO();
		FurnitureDAO dao = new FurnitureDAO();
		
		MemberVO mVO =MemberDAO.getMemberIdCheck(mid);
		ArrayList<FurnitureVO> vos = dao.getFurnitureAddCart(idxArray);
		
		request.setAttribute("mVO",mVO);
		request.setAttribute("vos",vos);
	}
}
