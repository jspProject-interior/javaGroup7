package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class MemberDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;
	
	public void pstmtClose() {
    if(pstmt != null) {
       try {
          pstmt.close();
       } catch (SQLException e) {}
    }
 }
 
 public void rsClose() {
	 if(rs != null) {
		 try {
			 rs.close();
     } catch (SQLException e) {
     } finally { 
    	 pstmtClose(); 
     }
   }
 }

//Member Table에서 ID 검색하기
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
	     vo.setIdx(rs.getInt("idx"));
	     vo.setMid(rs.getString("mid"));
	     vo.setPwd(rs.getString("pwd"));
	     vo.setName(rs.getString("name"));
	     vo.setCompany(rs.getString("company"));
	     vo.setTel(rs.getString("tel"));
	     vo.setEmail(rs.getString("email"));
	     vo.setResident(rs.getString("resident"));
	     vo.setAddress(rs.getString("address"));
	     vo.setGender(rs.getString("gender"));
	     vo.setBirthday(rs.getString("birthday"));
	     vo.setLevel(rs.getInt("level"));
	     vo.setPhoto(rs.getString("photo"));
	     vo.setUserDel(rs.getString("userDel"));
	     vo.setJoinDay(rs.getString("joinDay"));
	     vo.setLastDate(rs.getString("lastDate"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		
		return vo;
	}
}
