package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberDeleteCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));

		
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		int res = dao.DeleteMember(idx);
		if(res != 0) {
			request.setAttribute("message", "회원이 탈퇴되었습니다.");
		}
		else {
			request.setAttribute("message", "탈퇴할 수 없는 회원입니다.");
		}
		request.setAttribute("url", "AdminMain.ad");
	}
}
