package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo = dao.getMemberIdCheck(mid);
		
		if(vo.getMid() == null) {
			request.setAttribute("message", "회원정보가 없습니다.\\n확인하고 다시 로그인하세요.");
			request.setAttribute("url", "main.main");
			return;
		}
		
//			String salt = vo.getPwd().substring(0,3);
//			
//			SecurityUtil security = new SecurityUtil();
//			pwd = security.encryptSHA256(salt + pwd);
//			
//			if(!vo.getPwd().substring(3).equals(pwd)) {
//				request.setAttribute("message", "회원정보가 없습니다.\\n확인하고 다시 로그인하세요.");
//				request.setAttribute("url", "MemberLogin.mem");
//				return;
//			}
			
//			---------- 로그인 처리 된 회원들 처리 ---------------
			
			// 세션에 저장할 항목
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sLastDate", vo.getLastDate());
			
			
			
			// 회원등급 별 등급 명칭을 strLevel변수에 저장한다.
			String strLevel = strLevelProcess(vo.getLevel());
			session.setAttribute("strLevel", strLevel);
			
					
			request.setAttribute("message", mid + "님 해윙");
			request.setAttribute("url", "main.main");
		}

		private String strLevelProcess(int level) {
			String strLevel = "";
			if(level == 0) {
				strLevel = "관리자";
			}
			else if(level == 1) {
				strLevel = "개인";
			}
			else if(level == 2) {
				strLevel = "업체";
			}
			else if(level == 99) {
				strLevel = "탈퇴예정회원";
			}
			return strLevel;
		}
}
