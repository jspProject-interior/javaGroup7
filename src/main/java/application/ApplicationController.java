package application;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberIdCheckCommand;

@WebServlet("*.ap")
public class ApplicationController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationInterface command = null;
		String viewPage = "/WEB-INF/application";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인 후 이용해주세요.");
			request.setAttribute("url", "/main.main");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/Calculator")) { //견적계산기
			viewPage += "/calculator.jsp";
		}
		else if(com.equals("/Application")) { //상담신청서
			command = new ApplicationCommand();
			command.execute(request, response);
			viewPage += "/application.jsp";
		}
		else if(com.equals("/ApplicationOk")) { //상담신청서
			command = new ApplicationOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/Love")) { //관심 목록
			command = new LoveCommand();
			command.execute(request, response);
			viewPage += "/love.jsp";
		}
		else if(com.equals("/MyPost")) { //내 게시물 보기
			command = new MyPostCommand();
			command.execute(request, response);
			viewPage += "/myPost.jsp";
		}
		else if(com.equals("/CounselList")) { // 상담신청 내역
			command = new CounselListCommand();
			command.execute(request, response);
			viewPage += "/counselList.jsp";
		}
		else if(com.equals("/CounselListDetail")) { // 상담신청 디테일
			command = new CounselListDetailCommand();
			command.execute(request, response);
			viewPage += "/counselListDetail.jsp";
		}
		else if(com.equals("/ConsultationStatus")) { // 상담신청 디테일
			command = new ConsultationStatusCommand();
			command.execute(request, response);
			viewPage += "/consultationStatus.jsp";
		}
		else if(com.equals("/approvalChange")) { // 상담신청 디테일
			command = new approvalChangeCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
