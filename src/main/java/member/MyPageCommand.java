package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import furniture.FurnitureDAO;
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
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getMyPost(mid); 
//		ArrayList<InteriorVO> FurnitureVOS = FurnitureDAO.getMemberIdCheck(mid);
		
		request.setAttribute("vo", vo);
		request.setAttribute("InteriorVOS", InteriorVOS);
	}

}
