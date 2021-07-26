package kr.co.bit.library.managerInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.bit.library.common.util.JDBC_Close;
import kr.co.bit.library.room.ReadingRoom;

public class ManagerInfoDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private final String DRIVER = "oracle.jdbc.OracleDriver";
	private String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private String USER = "BLIBRARY";
	private String PASSWORD = "BLIBRARY";
	
	public ManagerInfo managerInfo() {
		
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			String sql = "SELECT MANAGERID, MANAGERPW "
					+ " FROM MANAGERINFO ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String managerId = rs.getString(1);
				String managerPw = rs.getString(2);
				ManagerInfo m = new ManagerInfo(managerId, managerPw);
				return m;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBC_Close.closeConnStmtRs(conn, pstmt, rs);
		}
		return null;
	}
	
	
	}
