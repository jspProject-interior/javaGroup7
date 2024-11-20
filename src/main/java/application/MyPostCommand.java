package application;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interior.InteriorDAO;
import interior.InteriorVO;

public class MyPostCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String level = (String)request.getAttribute("sLevel");
		
		InteriorDAO InteriorDAO = new InteriorDAO();
		
		ArrayList<InteriorVO> InteriorVOS = InteriorDAO.getMyPost(mid);
		
		request.setAttribute("InteriorVOS", InteriorVOS);
		request.setAttribute("sLevel", level);
	}

}
