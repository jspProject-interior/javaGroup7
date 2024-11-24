package furniture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class PurchaseDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private PurchaseVO vo = null;
	
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
	
	public int setPurchaseOk(PurchaseVO vo) {
		int res = 0;
		try {
			sql = "insert into purchase values(default, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCusMid());
			pstmt.setString(2, vo.getComMid());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getCompany());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getCategory());
			pstmt.setString(8, vo.getTitle());
			pstmt.setString(9, vo.getThumbnail());
			pstmt.setInt(10, vo.getPay());
			pstmt.setInt(11, vo.getDiscount());
			pstmt.setInt(12, vo.getPrice());
			pstmt.setInt(13, vo.getCnt());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<PurchaseVO> getBuyList(String mid) {
		ArrayList<PurchaseVO> vos = new ArrayList<PurchaseVO>();
		
		try {
			sql = "select * from purchase where cusMid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PurchaseVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setCusMid(rs.getString("cusMid"));
				vo.setComMid(rs.getString("comMid"));
				vo.setName(rs.getString("name"));
				vo.setCompany(rs.getString("company"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setThumbnail(rs.getString("thumbnail"));
				vo.setPay(rs.getInt("pay"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPrice(rs.getInt("price"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setPurDate(rs.getString("purDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return vos;
	}

	public ArrayList<PurchaseVO> getSellList(String mid) {
		ArrayList<PurchaseVO> vos = new ArrayList<PurchaseVO>();
		
		try {
			sql = "select * from purchase where comMid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PurchaseVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setCusMid(rs.getString("cusMid"));
				vo.setComMid(rs.getString("comMid"));
				vo.setName(rs.getString("name"));
				vo.setCompany(rs.getString("company"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setThumbnail(rs.getString("thumbnail"));
				vo.setPay(rs.getInt("pay"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPrice(rs.getInt("price"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setPurDate(rs.getString("purDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return vos;
	}

	public ArrayList<PurchaseVO> getUseList() {
ArrayList<PurchaseVO> vos = new ArrayList<PurchaseVO>();
		
		try {
			sql = "select * from purchase";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PurchaseVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setCusMid(rs.getString("cusMid"));
				vo.setComMid(rs.getString("comMid"));
				vo.setName(rs.getString("name"));
				vo.setCompany(rs.getString("company"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setThumbnail(rs.getString("thumbnail"));
				vo.setPay(rs.getInt("pay"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPrice(rs.getInt("price"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setPurDate(rs.getString("purDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return vos;
	}
}
