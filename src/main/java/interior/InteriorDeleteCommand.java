package interior;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InteriorDeleteCommand implements InteriorInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		
		InteriorDAO dao = new InteriorDAO();
		int res = dao.InteriorDelete(idx);

		if(res != 1) {
			request.setAttribute("message", "게시물 삭제 실패");
			request.setAttribute("url", "InteriorContent.in?idx=" + idx);
		}
		else {
			request.setAttribute("message", "게시물이 삭제 되었습니다.");
			request.setAttribute("url", "Interior.in");
		}
		
	}
}
