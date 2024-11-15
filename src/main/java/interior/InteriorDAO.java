package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class InteriorDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private InteriorVO vo = null;
	
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

	public int setInteriorInput(InteriorVO vo) {
		int res = 0;
		try {
			sql = "insert into interior values(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getCompany());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getTitle());
			pstmt.setInt(5, vo.getPrice());
			pstmt.setString(6, vo.getTitleImg());
			pstmt.setString(7, vo.getSubImg());
			pstmt.setString(8, vo.getThumbnail());
			pstmt.setString(9, vo.getfName());
			pstmt.setString(10, vo.getfSName());
			pstmt.setInt(11, vo.getfSize());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

//	인테리어 게시물 전체 불러오기
	public ArrayList<InteriorVO> getinteriorList() {
		ArrayList<InteriorVO> vos = new ArrayList<InteriorVO>();
		try {
			sql = "select * from interior";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new InteriorVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setCompany(rs.getString("company"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setTitleImg(rs.getString("titleImg"));
				vo.setSubImg(rs.getString("subImg"));
				vo.setThumbnail(rs.getString("thumbnail"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setClaim(rs.getString("claim"));
				vo.setwDate(rs.getString("wDate"));
				vo.setInterest(rs.getString("interest"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		
		return vos;
	}

	public InteriorVO getInteriorContent(int idx) {
		vo = new InteriorVO();
		try {
			sql = "select * from interior where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setCompany(rs.getString("company"));
			vo.setCategory(rs.getString("category"));
			vo.setTitle(rs.getString("title"));
			vo.setTitleImg(rs.getString("titleImg"));
			vo.setSubImg(rs.getString("subImg"));
			vo.setThumbnail(rs.getString("thumbnail"));
			vo.setfName(rs.getString("fName"));
			vo.setfSName(rs.getString("fSName"));
			vo.setfSize(rs.getInt("fSize"));
			vo.setClaim(rs.getString("claim"));
			vo.setwDate(rs.getString("wDate"));
			vo.setInterest(rs.getString("interest"));
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
}