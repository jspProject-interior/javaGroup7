package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/MemberJoin")) { //회원가입
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberIdCheck")) { //아이디중복확인
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			viewPage += "/memberIdCheck.jsp";
		}
		else if(com.equals("/MemberLogin")) { //로그인 입력창
			command = new MemberLoginCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogout")) { //로그아웃
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "main.main";
		}
		else if(com.equals("/AjaxLevel")) {
			command = new AjaxLevelCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FindAccount")) {
			viewPage += "/findAccount.jsp";
		}
		else if(com.equals("/FindId")) { //아이디찾기
			command = new FindIdCommand();
			command.execute(request, response);
			viewPage += "/findId.jsp";
		}
		else if(com.equals("/FindPassword")) { //비밀번호 변경
			command = new FindPasswordCommand();
			command.execute(request, response);
			viewPage += "/findPwd.jsp";
		}
		else if(com.equals("/PasswordUpdate")) { //비밀번호 수정
			command = new PasswordUpdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/moveUpdate")) { // 정보 수정으로 이동
			command = new moveUpdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/CustomerUpdate")) { //	개인 정보 수정
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/customerUpdate.jsp";
		}
		else if(com.equals("/CompanyUpdate")) { // 업체 정보 수정
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/companyUpdate.jsp";
		}
		else if(com.equals("/MemberUpdateOk")) { // 정보 수정
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MyPage")) { // 마이페이지
			command = new MyPageCommand();
			command.execute(request, response);
			viewPage += "/myPage.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
