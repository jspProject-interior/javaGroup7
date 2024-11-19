package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		int level = (int)session.getAttribute("sLevel");

		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		String resident1 = "";
		String resident2 = "";
		
		if(level == 1) {
			resident1 = vo.getResident().substring(0,6);
			resident2 = vo.getResident().substring(7);
		}
		
		String tels[] = vo.getTel().split("-");
		String tel1 = tels[0];
		String tel2 = tels[1];
		String tel3 = tels[2];
		
		String addresses[] = vo.getAddress().split("/");
		String address1 = addresses[0].trim();
		String address2 = addresses[1].trim();
		String address3 = addresses[2].trim();
		String address4 = addresses[3].trim();
		
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("resident1", resident1);
		request.setAttribute("resident2", resident2);
		request.setAttribute("tel1", tel1);
		request.setAttribute("tel2", tel2);
		request.setAttribute("tel3", tel3);
		request.setAttribute("address1", address1);
		request.setAttribute("address2", address2);
		request.setAttribute("address3", address3);
		request.setAttribute("address4", address4);
	}
}
