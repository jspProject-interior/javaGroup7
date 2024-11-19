package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindPasswordCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") ==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name") ==null ? "" : request.getParameter("name");
		String tel1 = request.getParameter("tel1") ==null ? "" : request.getParameter("tel1");
		String tel2 = request.getParameter("tel2") ==null ? "" : request.getParameter("tel2");
		String tel3 = request.getParameter("tel3") ==null ? "" : request.getParameter("tel3");
		
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		
		MemberDAO dao = new MemberDAO();
		
		int pwd = dao.getFindPwd(mid, name, tel);
		
		request.setAttribute("mid", mid);
		request.setAttribute("pwd", pwd);
	}

}
