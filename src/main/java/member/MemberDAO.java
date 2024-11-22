package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import interior.InteriorVO;

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
//회원가입
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default);";
			pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getMid());
      pstmt.setString(2, vo.getPwd());
      pstmt.setString(3, vo.getName());
      pstmt.setString(4, vo.getCompany());
      pstmt.setString(5, vo.getTel());
      pstmt.setString(6, vo.getEmail());
      pstmt.setString(7, vo.getResident());
      pstmt.setString(8, vo.getAddress());
      pstmt.setString(9, vo.getGender());
      pstmt.setString(10, vo.getBirthday());
      pstmt.setInt(11, vo.getLevel());
      pstmt.setString(12, vo.getPhoto());
      res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public String getFindId(String name, String tel) {
		String mid = "";
		try {
			sql = "select mid from member where name = ? and tel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mid = rs.getString("mid");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return mid;
	}

	public int getFindPwd(String mid, String name, String tel) {
		int res = 0;
		try {
			sql = "select pwd from member where mid = ? and name = ? and tel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, name);
			pstmt.setString(3, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = 1;
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	public int setPasswordUpdate(String pwd, String mid) {
		int res = 0;
		try {
			sql = "update member set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	public int MemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set pwd=?, name=?, company=?, tel=?, email=?, resident=?, address=?, gender=?, birthday=?, level=?, photo=? where mid=?";
			pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getPwd());
      pstmt.setString(2, vo.getName());
      pstmt.setString(3, vo.getCompany());
      pstmt.setString(4, vo.getTel());
      pstmt.setString(5, vo.getEmail());
      pstmt.setString(6, vo.getResident());
      pstmt.setString(7, vo.getAddress());
      pstmt.setString(8, vo.getGender());
      pstmt.setString(9, vo.getBirthday());
      pstmt.setInt(10, vo.getLevel());
      pstmt.setString(11, vo.getPhoto());
      pstmt.setString(12, vo.getMid());
      res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<MemberVO> getMemberList(int level) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			if(level != 777) {
				sql = "select * from member where level = ? order by name";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			else {
				sql = "select * from member order by name";
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				
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
	      
	      vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return vos;
	}

	public int DeleteMember(int idx) {
		int res = 0;
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	public int MemberUserDel(int idx) {
		int res = 0;
		try {
			sql = "update member set userDel = 'OK', level = 99 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

}

