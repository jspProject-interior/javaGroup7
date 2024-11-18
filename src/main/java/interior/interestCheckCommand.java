package interior;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class interestCheckCommand implements InteriorInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
	
		InteriorDAO dao = new InteriorDAO();
		
		HttpSession session = request.getSession();
		ArrayList<String> contentGood = (ArrayList<String>)session.getAttribute("sContentGood");
		
		if(contentGood == null) {
			contentGood = new ArrayList<String>();
		}
		String tempContentGood = "interior" + idx;
		int res = 0;
		if(!contentGood.contains(tempContentGood)) {
			res = dao.setInteriorInterestCheck(idx, 1);
			contentGood.add(tempContentGood);
		}
		else {
			res = dao.setInteriorInterestCheck(idx, -1);
			contentGood.remove(tempContentGood);
		}
		session.setAttribute("sContentGood", contentGood);
		response.getWriter().write(res+"");
	}
}