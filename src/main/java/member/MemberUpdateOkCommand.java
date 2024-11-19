package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") ==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd2") ==null ? "" : request.getParameter("pwd2");
		String name = request.getParameter("name") ==null ? "" : request.getParameter("name");
		String company = request.getParameter("company") ==null ? "" : request.getParameter("company");
		String tel = request.getParameter("tel") ==null ? "" : request.getParameter("tel");
		String email = request.getParameter("email") ==null ? "" : request.getParameter("email");
		String resident = request.getParameter("resident") ==null ? "" : request.getParameter("resident");
		String address = request.getParameter("address") ==null ? "" : request.getParameter("address");
		String photo = request.getParameter("photo") ==null ? "noimage.jpg" : request.getParameter("photo");
		int level = (request.getParameter("level") == null || request.getParameter("level").equals("")) ? 999 : Integer.parseInt(request.getParameter("level"));
		String birthdayStr = request.getParameter("birthday") ==null ? "" : request.getParameter("birthday");
		String genderStr = request.getParameter("gender") ==null ? "" : request.getParameter("gender");
		
		String birthday = "";
		String gender = "";
		// 성별 변환	
		if(genderStr.equals("1")||genderStr.equals("3")) {
			gender = "남성";
		}
		else {
			gender = "여성";
		}
	// 생년월일 변환	
		if(genderStr.equals("1")||genderStr.equals("2")) {
			String year = "19" + birthdayStr.substring(0, 2);
      String month = birthdayStr.substring(2, 4);       
      String day = birthdayStr.substring(4, 6);
      
      birthday = year + "-" + month + "-" + day;
		}
		else if(genderStr.equals("3")||genderStr.equals("4")){
			String year = "20" + birthdayStr.substring(0, 2);
      String month = birthdayStr.substring(2, 4);       
      String day = birthdayStr.substring(4, 6);
      
      birthday = year + "-" + month + "-" + day;
		}
		else {
			birthday = "1900-01-01";
		}
		
	// 비밀번호 암호화
		long temp = (int)(Math.random()*(999-100+1))+100;
		String salt = temp + "";
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		pwd = salt + pwd;
		
		
		//level 변환
		/*
		 * if (!levelStr.isEmpty()) { try { level = Integer.valueOf(levelStr); // 문자열을
		 * Integer로 변환 후 기본형 int로 사용 } catch (NumberFormatException e) { level = 999;
		 * System.out.println("sql오류 : " + e.getMessage()); } }
		 */
		
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
		
		MemberDAO dao = new MemberDAO();
	
		int res = dao.MemberUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "정보 수정 완료");
			request.setAttribute("url", "main.main");
		}
		else {
			request.setAttribute("message", "정보 수정 실패");
			request.setAttribute("url", "moveUpdate.mem");
		}
	}
}