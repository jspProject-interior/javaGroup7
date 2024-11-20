package application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			sql="insert into application values(default,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(10, vo.getArea());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			 System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
