package application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class ApplicationDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private ApplicationVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(pstmt != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally { pstmtClose(); }
		}
	}

	public int setApplicationOk(ApplicationVO vo) {
		int res=0;
		try {
			sql="insert into application values(default,?,?,?,?,?,?,?,?,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getConAddress());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getCategory());
			pstmt.setInt(6, vo.getPrice());
			pstmt.setInt(7, vo.getBudget());
			pstmt.setInt(8, vo.getSize());
			pstmt.setString(9, vo.getConStartDay());
			pstmt.setString(10, vo.getCompanyMid());
			pstmt.setString(11, vo.getCompanyName());
			pstmt.setString(12, vo.getArea());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			 System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<ApplicationVO> getCounselList(String mid) {
		ArrayList<ApplicationVO> vos = new ArrayList<ApplicationVO>();
		try {
			sql = "select * from application where companyMid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ApplicationVO();
				
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setConAddress(rs.getString("conAddress"));
				vo.setTel(rs.getString("tel"));
				vo.setCategory(rs.getString("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setBudget(rs.getInt("budget"));
				vo.setSize(rs.getInt("size"));
				vo.setConStartDay(rs.getString("conStartDay"));
				vo.setCompanyMid(rs.getString("companyMid"));
				vo.setCompanyName(rs.getString("companyName"));
				vo.setArea(rs.getString("area"));
				vo.setTreatment(rs.getString("treatment"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			 System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public ApplicationVO getUserInfo(String mid) {
		vo = new ApplicationVO();
		try {
			sql = "select * from application where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setConAddress(rs.getString("conAddress"));
				vo.setTel(rs.getString("tel"));
				vo.setCategory(rs.getString("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setBudget(rs.getInt("budget"));
				vo.setSize(rs.getInt("size"));
				vo.setConStartDay(rs.getString("conStartDay"));
				vo.setCompanyMid(rs.getString("companyMid"));
				vo.setCompanyName(rs.getString("companyName"));
				vo.setArea(rs.getString("area"));
				vo.setTreatment(rs.getString("treatment"));
			}
		} catch (SQLException e) {
			 System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	public ArrayList<ApplicationVO> getConsultationStatus(String mid) {
		ArrayList<ApplicationVO> vos = new ArrayList<ApplicationVO>();
		try {
			sql = "select * from application where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ApplicationVO();
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setConAddress(rs.getString("conAddress"));
				vo.setTel(rs.getString("tel"));
				vo.setCategory(rs.getString("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setBudget(rs.getInt("budget"));
				vo.setSize(rs.getInt("size"));
				vo.setConStartDay(rs.getString("conStartDay"));
				vo.setCompanyMid(rs.getString("companyMid"));
				vo.setCompanyName(rs.getString("companyName"));
				vo.setArea(rs.getString("area"));
				vo.setTreatment(rs.getString("treatment"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			 System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public int setApproval(int idx, String approval) {
		int res = 0;
		try {
			sql = "update application set treatment = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, approval);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			 System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
