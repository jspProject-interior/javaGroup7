package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/AjaxLevel")
public class AjaxLevel extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ALevel = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 0 : Integer.parseInt(request.getParameter("level"));
		MemberVO vo = new MemberVO();
		
		vo.setLevel(ALevel);
		
		System.out.println(vo);
		request.setAttribute("vo", vo);
		request.setAttribute("level", ALevel);
		response.getWriter().write(ALevel+"");
	}
}
