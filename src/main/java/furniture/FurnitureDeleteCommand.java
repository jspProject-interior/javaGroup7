package furniture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interior.InteriorDAO;

public class FurnitureDeleteCommand implements FurnitureInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		FurnitureDAO dao = new FurnitureDAO();
		int res = dao.FurnitureDelete(idx);

		if(res != 1) {
			request.setAttribute("message", "등록된 상품 삭제 실패");
			request.setAttribute("url", "FurnitureContent.fu?idx=" + idx);
		}
		else {
			request.setAttribute("message", "등록된 상품이 삭제 되었습니다.");
			request.setAttribute("url", "Furniture.fu");
		}

	}

}
