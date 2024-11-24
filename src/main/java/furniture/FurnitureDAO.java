package furniture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	public int setFurnitureInput(FurnitureVO vo) {
		int res = 0;
		try {
			sql = "insert into furniture values(default, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?, ?, ?, default, default, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getCompany());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getTitle());
			pstmt.setInt(5, vo.getPay());
			pstmt.setInt(6, vo.getDiscount());
			pstmt.setString(7, vo.getSaleUnit());
			pstmt.setInt(8, vo.getPrice());
			pstmt.setString(9, vo.getTitleImg());
			pstmt.setString(10, vo.getSubImg());
			pstmt.setString(11, vo.getThumbnail());
			pstmt.setString(12, vo.getfName());
			pstmt.setString(13, vo.getfSName());
			pstmt.setInt(14, vo.getfSize());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
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
				vo.setPay(rs.getInt("pay"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setSaleUnit(rs.getString("saleUnit"));
				vo.setPrice(rs.getInt("price"));
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
			vo.setPay(rs.getInt("pay"));
			vo.setDiscount(rs.getInt("discount"));
			vo.setSaleUnit(rs.getString("saleUnit"));
			vo.setPrice(rs.getInt("price"));
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

	public int setFurnitureInterestCheck(int idx, int add) {
		int res = 0;
		try {
			sql="update furniture set interest = interest + ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, add);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public int FurnitureDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from furniture where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<FurnitureVO> getFurniturePost(String mid) {
		ArrayList<FurnitureVO> vos = new ArrayList<FurnitureVO>();
		try {
			if(mid.equals("전체") || mid.equals("ALL")) {
				sql = "select * from furniture";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select * from furniture where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
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
		}
		finally {
			rsClose();
		}
		
		return vos;
	}

	public ArrayList<FurnitureVO> getFurnitureIdxSearch(HttpServletRequest request) {
		ArrayList<FurnitureVO> vos = new ArrayList<FurnitureVO>();
		HttpSession session = request.getSession();
		ArrayList<String> sContentGood = (ArrayList<String>)session.getAttribute("sContentGood");
		if (sContentGood == null) {
    	sContentGood = new ArrayList<>();
    }
		String furnitureBoard[] = sContentGood.toString().split(",");
		try {
			for(int i = 0; i < furnitureBoard.length; i++) {
				furnitureBoard[i] = furnitureBoard[i].replace("furniture", "").replace("[", "").replace("]", "").trim();
				
				sql = "select * from furniture where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, furnitureBoard[i]);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new FurnitureVO();
					
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setCompany(rs.getString("company"));
					vo.setCategory(rs.getString("category"));
					vo.setTitle(rs.getString("title"));
					vo.setPay(rs.getInt("pay"));
					vo.setDiscount(rs.getInt("discount"));
					vo.setSaleUnit(rs.getString("saleUnit"));
					vo.setPrice(rs.getInt("price"));
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
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public ArrayList<FurnitureVO> getFurnitureAddCart(String idxArray) {
		ArrayList<FurnitureVO> vos = new ArrayList<FurnitureVO>();
		String list[] = idxArray.toString().split(",");
		try {
			for(int i = 0; i < list.length; i++) {
				list[i] = list[i].replace("cart", "").replace("[", "").replace("]", "").trim();
				
				sql = "select * from furniture where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list[i]);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new FurnitureVO();
					
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setCompany(rs.getString("company"));
					vo.setCategory(rs.getString("category"));
					vo.setTitle(rs.getString("title"));
					vo.setPay(rs.getInt("pay"));
					vo.setDiscount(rs.getInt("discount"));
					vo.setSaleUnit(rs.getString("saleUnit"));
					vo.setPrice(rs.getInt("price"));
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
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public int setFurnitureUpdate(FurnitureVO vo, int idx) {
		int res = 0;
		try {
			sql = "update furniture set category = ?, title = ?, pay = ?, saleUnit = ?, price = ?, titleImg = ?, subImg = ?, thumbnail = ?, fName = ?, fSName = ?, fSize = ?, discount = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getTitle());
			pstmt.setInt(3, vo.getPay());
			pstmt.setString(4, vo.getSaleUnit());
			pstmt.setInt(5, vo.getPrice());
			pstmt.setString(6, vo.getTitleImg());
			pstmt.setString(7, vo.getSubImg());
			pstmt.setString(8, vo.getThumbnail());
			pstmt.setString(9, vo.getfName());
			pstmt.setString(10, vo.getfSName());
			pstmt.setInt(11, vo.getfSize());
			pstmt.setInt(12, vo.getDiscount());
			pstmt.setInt(13, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public int addClaim(int idx) {
		int res = 0;
		try {
			sql = "update furniture set claim = claim + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<FurnitureVO> getClaimList() {
		ArrayList<FurnitureVO> vos = new ArrayList<FurnitureVO>();
		try {
			sql = "select * from furniture where claim > 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new FurnitureVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setCompany(rs.getString("company"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setPay(rs.getInt("pay"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setSaleUnit(rs.getString("saleUnit"));
				vo.setPrice(rs.getInt("price"));
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

	public ArrayList<FurnitureVO> getMyPostClaim(String mid) {
		ArrayList<FurnitureVO> vos = new ArrayList<FurnitureVO>();
		try {
			sql = "select * from furniture where claim > 0 and mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new FurnitureVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setCompany(rs.getString("company"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setPrice(rs.getInt("price"));
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
}
