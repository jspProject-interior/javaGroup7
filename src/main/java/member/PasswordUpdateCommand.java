package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class PasswordUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") ==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd2") ==null ? "" : request.getParameter("pwd2");
		
		MemberDAO dao = new MemberDAO();
		
		// 비밀번호 암호화
		long temp = (int)(Math.random()*(999-100+1))+100;
		String salt = temp + "";
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		pwd = salt + pwd;
		
		int res = dao.setPasswordUpdate(pwd, mid);
		
		if(res != 0) {
			request.setAttribute("message", "비밀번호가 변경되었습니다.");
			request.setAttribute("url", "main.main");
		}
		else {
			request.setAttribute("message", "비밀번호 변경에 실패하였습니다.");
			request.setAttribute("url", "FindPassword.mem");
		}
	}
}
