package furniture;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FurnitureInputCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/furniture/upload");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String ofName = "";
		String fsName = "";
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) { 
				ofName += multipartRequest.getOriginalFileName(file) + "/";
				fsName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
		ofName = ofName.substring(0, ofName.lastIndexOf("/"));
		fsName = fsName.substring(0, fsName.lastIndexOf("/"));
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String company = multipartRequest.getParameter("company")==null ? "" : multipartRequest.getParameter("company");
		String category = multipartRequest.getParameter("category") == null ? "" : multipartRequest.getParameter("category");
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
		int price = multipartRequest.getParameter("price") == null || multipartRequest.getParameter("price").equals("") ? 0 : Integer.parseInt(multipartRequest.getParameter("price").replace(",", ""));
		String titleImg = multipartRequest.getFilesystemName("titleImg") == null ? "" : multipartRequest.getFilesystemName("titleImg");
		String subImg = multipartRequest.getFilesystemName("subImg") == null ? "" : multipartRequest.getFilesystemName("subImg");
		String thumbnail = multipartRequest.getFilesystemName("thumbnail") == null ? "" : multipartRequest.getFilesystemName("thumbnail");
		int fSize = (multipartRequest.getParameter("fSize")==null || multipartRequest.getParameter("fSize").equals("")) ? 0 : Integer.parseInt(multipartRequest.getParameter("fSize"));
		FurnitureVO vo = new FurnitureVO();
		vo.setMid(mid);
		vo.setCompany(company);
		vo.setCategory(category);
		vo.setTitle(title);
		vo.setPrice(price);
		vo.setTitleImg(titleImg);
		vo.setSubImg(subImg);
		vo.setThumbnail(thumbnail);
		vo.setfName(ofName);
		vo.setfSName(fsName);
		vo.setfSize(fSize);
		
		FurnitureDAO dao = new FurnitureDAO();
		
		int res = dao.setFurnitureInput(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시물 등록이 완료되었습니다.");
			request.setAttribute("url", "Furniture.fu");
		}
		else {
			request.setAttribute("message", "잠시 후 다시 시도해주세요.");
			request.setAttribute("url", "FurnitureInput.fu");
		}
	}
}
