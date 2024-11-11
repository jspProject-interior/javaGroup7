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
}
