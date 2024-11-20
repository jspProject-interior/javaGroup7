package application;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApplicationOkCommand implements ApplicationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ApplicationDAO dao = new ApplicationDAO();
		
		
		
		ApplicationVO vo = new ApplicationVO();
		
		
//		여기부터 주석 풀고 작성하시면 됩니다요
		
//		vo.setMid(mid);
//		vo.setCompany(company);
//		vo.setCategory(category);
//		vo.setTitle(title);
//		vo.setPrice(price);
//		vo.setTitleImg(titleImg);
//		vo.setSubImg(subImg);
//		vo.setThumbnail(thumbnail);
//		vo.setfName(ofName);
//		vo.setfSName(fsName);
//		vo.setfSize(fSize);
		
//		int res = dao.setApplicationOk(vo);
		
//		if(res != 0) {
//			request.setAttribute("message", "상담신청이 완료되었습니다.");
//			request.setAttribute("url", "main.main");
//		}
//		else {
//			request.setAttribute("message", "잠시 후 다시 시도해주세요.");
//			request.setAttribute("url", "Application.ap");
//		}
		

	}

}
