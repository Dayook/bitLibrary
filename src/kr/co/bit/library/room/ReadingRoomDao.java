package kr.co.bit.library.room;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.library.common.util.JDBC_Close;


public class ReadingRoomDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private final String DRIVER = "oracle.jdbc.OracleDriver";
	private String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private String USER = "BLIBRARY";
	private String PASSWORD = "BLIBRARY";
	

	   // 1. 열람실 생성
	   public int CreateRoom(ReadingRoom r) {
	      int result = 0;;
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         // 기본 이용시간 3시간
	         String sql = "INSERT INTO ROOMS "
	               + "(ROOMID, ROOMNAME, ROWCOUNT, COLCOUNT, SEATCOUNT, USETIME) "
	               + "VALUES(?,?,?,?,?,3)";
	         pstmt = conn.prepareStatement(sql);
	         
	         
	         pstmt.setInt(1, r.getRoomId());
	         pstmt.setString(2, r.getRoomName());
	         pstmt.setInt(3, r.getRowCount());
	         pstmt.setInt(4, r.getColCount());
	         pstmt.setInt(5, r.getSeatCount());
	         
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         
	         try {
	            
	            pstmt.close();
	            conn.close();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         
	      }
	      
	   return result;
	   }
	   
	   
	   // 2.(1) 열람실 조회 - 번호로 조회 - 지워도 될듯
	   public ReadingRoom selectOne(int roomId) {
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "SELECT ROOMNAME, ROWCOUNT, COLCOUNT, USETIME "
	               + " FROM ROOMS WHERE ROOMID = ? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, roomId);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            String roomName = rs.getString(1);
	            int rowCount = rs.getInt(2);
	            int colCount = rs.getInt(3);
	            int useTime = rs.getInt(4);
	            ReadingRoom r = new ReadingRoom(roomId, roomName, rowCount, colCount, useTime);
	            return r;
	         }
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         
	         try {
	            
	            rs.close();
	            pstmt.close();
	            conn.close();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         
	      }
	      return null;
	   }
	   
	   
	   // 2.(2) 열람실 조회 - 이름으로 조회
	   public ReadingRoom selectOne(String roomName) {
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "SELECT ROOMID, ROWCOUNT, COLCOUNT "
	               + " FROM ROOMS WHERE ROOMID = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, roomName);
	         
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            int roomId = rs.getInt(1);
	            int rowCount = rs.getInt(2);
	            int colCount = rs.getInt(3);
	            ReadingRoom r = new ReadingRoom(roomId, roomName, rowCount, colCount);
	            return r;
	         }
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {

	         try {
	            
	            rs.close();
	            pstmt.close();
	            conn.close();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	       
	      return null;
	   }
	   
	   
	   // 2.(3) 열람실 조회 - 전체조회
	   public List<ReadingRoom> selectAll() {
	      
	      List<ReadingRoom> rList = new ArrayList<ReadingRoom>();
	      
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "SELECT ROOMID, ROOMNAME, ROWCOUNT, COLCOUNT, USETIME "
	               + " FROM ROOMS ORDER BY ROOMID";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         
	         while(rs.next()) {
	            int roomId = rs.getInt(1);
	            String roomName = rs.getString(2);
	            int rowCount = rs.getInt(3);
	            int colCount = rs.getInt(4);
	            int useTime = rs.getInt(5);
	            ReadingRoom r = new ReadingRoom(roomId, roomName, rowCount, colCount, useTime);
	            rList.add(r);
	         }
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {

	         try {
	            
	            rs.close();
	            pstmt.close();
	            conn.close();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	       
	      return rList;
	   }
	   
	   
	   
	   
	   // 3. 열람실 수정 - 열람실번호 입력하여 열람실 이름 수정
	   public int updateName(int roomId, String roomName) {
	      int result = 0;
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "UPDATE ROOMS "
	               + " SET ROOMNAME = ? "
	               + " WHERE ROOMID = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, roomName);
	         pstmt.setInt(2, roomId);
	         result = pstmt.executeUpdate();
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      System.out.println(result+"건 수정하였습니다.");
	      return result;
	      
	   }
	   
	   
	   // 4. 열람실 삭제 (1) 열람실번호 입력하여 삭제
	   public int deleteOne(int roomId) {
	      int result = 0;
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "DELETE FROM ROOMS "
	               + " WHERE ROOMID = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, roomId);
	         result = pstmt.executeUpdate();
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {

	         try {
	            
	            pstmt.close();
	            conn.close();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         
	      }
	      return result;
	   }
	   
	   
	   // 4. 열람실 삭제 (2) 전체 삭제
	   public int deleteAll() {
	      int result = 0;
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "DELETE FROM ROOMS ";
	         pstmt = conn.prepareStatement(sql);
	         result = pstmt.executeUpdate();
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         

	         try {
	            
	            pstmt.close();
	            conn.close();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }
	   
	   
	   
	   public int managingUseTime(int roomId, int useTime) {
	      int result = 0;
	      try {
	         Class.forName(DRIVER);
	         conn = DriverManager.getConnection(URL, USER, PASSWORD);
	         
	         String sql = "UPDATE ROOMS "
	               + " SET USETIME = ? WHERE ROOMID = ? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, useTime);
	         pstmt.setInt(2, roomId);
	         result = pstmt.executeUpdate();
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         e.printStackTrace();
	      } finally { 
	         JDBC_Close.closeConnStmt(conn, pstmt);
	      }      
	      return result;
	   }
	   
	   
	   
	   
	   
	}