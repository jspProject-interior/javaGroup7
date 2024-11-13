package interior;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InteriorInputCommand implements InteriorInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024	* 30;	// 1024Byte=1KB=2^10 , 1MB=1024KBte=2^20Byte=1024B*1024B
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String company = multipartRequest.getParameter("company") == null ? "" : request.getParameter("company");
		String category = multipartRequest.getParameter("category") == null ? "" : request.getParameter("category");
		String title = multipartRequest.getParameter("title") == null ? "" : request.getParameter("title");
		String titleImg = multipartRequest.getParameter("titleImg") == null ? "" : request.getParameter("titleImg");
		String subImg = multipartRequest.getParameter("subImg") == null ? "" : request.getParameter("subImg");
		String thumbnail = multipartRequest.getParameter("thumbnail") == null ? "" : request.getParameter("thumbnail");
		
	}
}

