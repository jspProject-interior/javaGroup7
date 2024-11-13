package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") ==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") ==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") ==null ? "" : request.getParameter("name");
		String company = request.getParameter("company") ==null ? "" : request.getParameter("company");
		String tel = request.getParameter("tel") ==null ? "" : request.getParameter("tel");
		String email = request.getParameter("email") ==null ? "" : request.getParameter("email");
		String resident = request.getParameter("resident") ==null ? "" : request.getParameter("resident");
		String address = request.getParameter("address") ==null ? "" : request.getParameter("address");
		String photo = request.getParameter("photo") ==null ? "" : request.getParameter("photo");
		int level = (request.getParameter("level") == null || request.getParameter("level").equals("")) ? 999 : Integer.parseInt(request.getParameter("level"));
		String birthday = null;
		String gender = null;
		
		if(level == 1) {
			 birthday = resident.substring(0,5);
			 gender = resident.substring(6,1);			
		}
		
		MemberVO vo = new MemberVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setCompany(company);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setResident(resident);
		vo.setAddress(address);
		vo.setPhoto(photo);
		vo.setLevel(level);
		vo.setBirthday(birthday);
		vo.setGender(gender);
		
		
		System.out.println("vo : " + vo);
		
		MemberDAO dao = new MemberDAO();
	/*	
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 가입 완료");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원 가입 실패");
			request.setAttribute("url", "MemberJoin.mem");
		}
		*/
	}

}
