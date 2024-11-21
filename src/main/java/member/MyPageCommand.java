package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import application.ApplicationDAO;
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
		ApplicationDAO ApplicationDAO = new ApplicationDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		int interiorPostCnt = InteriorDAO.getInteriorPost(mid).size(); 
//		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getMemberIdCheck(mid);
		
		int counselListCnt = ApplicationDAO.getCounselList(mid).size();
		
		request.setAttribute("vo", vo);
		request.setAttribute("counselListCnt", counselListCnt);
		request.setAttribute("interiorPostCnt", interiorPostCnt);
	}

}
