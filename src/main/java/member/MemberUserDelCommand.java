package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUserDelCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		int res = dao.MemberUserDel(idx);
		
		if(res != 0) {
			request.setAttribute("message", "회원탈퇴신청이 완료되었습니다");
			request.setAttribute("url", "MemberLogout.mem");
		}
		else {
			request.setAttribute("message", "실패");
			request.setAttribute("url", "main.main");
		}

	}

}
