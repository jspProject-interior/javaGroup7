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

	/*
	 * public int setInteriorInput(InteriorVO vo) { int res = 0; try { sql =
	 * "insert into interior values(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default)"
	 * ; pstmt = conn.prepareStatement(sql); pstmt.setString(1, vo.getMid());
	 * pstmt.setString(2, vo.getCompany()); pstmt.setString(3, vo.getCategory());
	 * pstmt.setString(4, vo.getTitle()); pstmt.setInt(5, vo.getPrice());
	 * pstmt.setString(6, vo.getTitleImg()); pstmt.setString(7, vo.getSubImg());
	 * pstmt.setString(8, vo.getThumbnail()); pstmt.setString(9, vo.getfName());
	 * pstmt.setString(10, vo.getfSName()); pstmt.setInt(11, vo.getfSize()); res =
	 * pstmt.executeUpdate(); } catch (SQLException e) {
	 * System.out.println("SQL 오류 : " + e.getMessage()); } finally { pstmtClose(); }
	 * return res; }
	 */
}
