package furniture;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ComplaintCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		FurnitureDAO dao = new FurnitureDAO();
		
		HttpSession session = request.getSession();
		ArrayList<String> claimMid = (ArrayList<String>)session.getAttribute("sClaimMid");
		
		if(claimMid == null) {
			claimMid = new ArrayList<String>();
		}
		String tempClaimMid = "furniture / " + mid + " / " + idx;
		int res = 0;
		if(!claimMid.contains(tempClaimMid)) {
			res = dao.addClaim(idx);
			claimMid.add(tempClaimMid);
			System.out.println("res : " + res);
		}
		else {
			res = 2;
		}
		session.setAttribute("sClaimMid", claimMid);
		
		response.getWriter().write(res+"");

	}

}
