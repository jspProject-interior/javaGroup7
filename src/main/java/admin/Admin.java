package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import application.ApplicationDAO;
import application.ApplicationVO;
import furniture.FurnitureDAO;
import furniture.FurnitureVO;
import interior.InteriorDAO;
import interior.InteriorVO;
import member.MemberDAO;
import member.MemberVO;

public class Admin implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO MemberDAO = new MemberDAO();
		InteriorDAO InteriorDAO = new InteriorDAO();
		FurnitureDAO FurnitureDAO = new FurnitureDAO();
		ApplicationDAO ApplicationDAO = new ApplicationDAO();
		
		ArrayList<MemberVO> customerVOS = MemberDAO.getMemberList(1);
		ArrayList<MemberVO> companyVOS = MemberDAO.getMemberList(2);
		companyVOS.addAll(MemberDAO.getMemberList(3));
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getInteriorPost("ALL");
		ArrayList<FurnitureVO> FurnitureVOS = FurnitureDAO.getFurniturePost("ALL");
		ArrayList<ApplicationVO> ApplicationVOS = ApplicationDAO.getNewConsultationStatus();
		
		request.setAttribute("customerVOS", customerVOS);
		request.setAttribute("companyVOS", companyVOS);
		request.setAttribute("InteriorVOS", InteriorVOS);
		request.setAttribute("FurnitureVOS", FurnitureVOS);
		request.setAttribute("ApplicationVOS", ApplicationVOS);
	}
}
