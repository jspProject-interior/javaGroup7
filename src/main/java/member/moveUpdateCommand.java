package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class moveUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int level = (int)session.getAttribute("sLevel");
		
		System.out.println("updateCommand Level : " + level);

		if(level == 1) {
			request.setAttribute("message", "개인 정보 수정으로 이동합니다.");
			request.setAttribute("url", "CustomerUpdate.mem");
		}
		else {
			request.setAttribute("message", "업체 정보으로 이동합니다.");
			request.setAttribute("url", "CompanyUpdate.mem");
		}
	}
}
