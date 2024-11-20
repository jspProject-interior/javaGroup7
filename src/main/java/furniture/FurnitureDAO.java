package furniture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import interior.InteriorVO;

public class FurnitureDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private FurnitureVO vo = null;
	
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

	public ArrayList<FurnitureVO> getFurnitureList(String category) {
		ArrayList<FurnitureVO> vos = new ArrayList<FurnitureVO>();
		try {
			if(category.equals("ALL")) {
				sql = "select * from furniture";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select * from furniture where category = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new FurnitureVO();
				
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

	public FurnitureVO getFurnitureContent(int idx) {
		vo = new FurnitureVO();
		try {
			sql = "select * from furniture where idx = ?";
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
