package interior;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class interirorDeleteCommand implements InteriorInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titleImg = request.getParameter("titleImg") == null ? "" : request.getParameter("titleImg");
		String subImg = request.getParameter("subImg") == null ? "" : request.getParameter("subImg");
		String thumbnail = request.getParameter("thumbnail") == null ? "" : request.getParameter("thumbnail");
		String realPath = request.getServletContext().getRealPath("/images/interior/upload/");

		File title =  new File(realPath + titleImg);
		File sub =  new File(realPath + subImg);
		File thumb =  new File(realPath + thumbnail);
		
		String res = "0";
		if(title.exists() && sub.exists() && thumb.exists()) {
			title.delete();
			sub.delete();
			thumb.delete();
			res = "1";
			System.out.println("여기 안타?");
		}
		
		response.getWriter().write(res);

	}

}
