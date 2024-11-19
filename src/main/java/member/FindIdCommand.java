package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindIdCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") ==null ? "" : request.getParameter("name");
		String tel1 = request.getParameter("tel1") ==null ? "" : request.getParameter("tel1");
		String tel2 = request.getParameter("tel2") ==null ? "" : request.getParameter("tel2");
		String tel3 = request.getParameter("tel3") ==null ? "" : request.getParameter("tel3");
		
		MemberDAO dao = new MemberDAO();
		
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		
		String mid = dao.getFindId(name, tel);
		
		request.setAttribute("mid", mid);
	}
}
