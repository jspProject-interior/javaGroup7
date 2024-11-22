package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import application.ApplicationDAO;
import application.ApplicationVO;
import member.MemberDAO;
import member.MemberVO;

public class CounseDetail implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		ApplicationDAO dao = new ApplicationDAO();
		ApplicationVO vo = dao.getUserInfo(mid);
		
		MemberDAO MemberDAO = new MemberDAO();
		ArrayList<MemberVO> companyList = MemberDAO.getMemberList(2);
		companyList.addAll(MemberDAO.getMemberList(3));
		
		request.setAttribute("vo", vo);
		request.setAttribute("companyList", companyList);
	}
}
