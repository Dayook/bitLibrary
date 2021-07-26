package kr.co.bit.library.seat;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.library.common.util.JDBC_Close;

public class SeatDao {

	private final String Driver = "oracle.jdbc.OracleDriver";
	private String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "BLIBRARY";
	private String pwd = "BLIBRARY";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	   
	   // 1. 좌석 예약  - 만들어진 seat table에 USERID / EXPIRE TIME UPDATE
	   public int reserve(Seat seat) {
	      int result = 0;
	   

	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         
	         String sql = "UPDATE SEATS SET USERID = ? , "
	               + "     EXPTIME = SYSDATE + (INTERVAL '3' HOUR), "
	               + "   RV_OR_NOT = 1"
	               + "     WHERE ROOMID = ? " +
	               " AND SEATCODE = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	   
	         
	         pstmt.setString(1, seat.getUserId());
	         pstmt.setInt(2, seat.getRoomId());
	         pstmt.setString(3, seat.getSeatCode());
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException | ClassNotFoundException e) {
	         System.out.println("예약 실패");
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmt(conn, pstmt);
	      }
	      
	      return result;
	   }
	   
	   
	   
	   
	   
	   
	   public int cancel(String ID) {
	      int result = 0;
	      String sql = "UPDATE SEATS SET USERID = NULL, RV_OR_NOT = 0 "
	            + "WHERE USERID = ? ";

	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, ID);
	         result = pstmt.executeUpdate();
	      } catch (SQLException | ClassNotFoundException e) {
	         System.out.println("[system] 예약 취소 실패");
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmt(conn, pstmt);
	      }
	      System.out.println(result+"건 취소하였습니다.");
	      return result;
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   public int extend(String ID, int useTime) {
	      int result = 0;
	      String sql = "UPDATE SEATS SET EXPTIME = EXPTIME + ? * (INTERVAL '1' HOUR) "
	            + "WHERE USERID = ? ";
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, useTime);
	         pstmt.setString(2, ID);
	         result = pstmt.executeUpdate();
	         System.out.println("연장 성공하였습니다.");
	      } catch (SQLException e) {
	         System.out.println("[system] 예약 연장 실패");
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmt(conn, pstmt);
	      }
	      
	      return result;
	      
	   }

	   
	   
	   
	   // 좌석 예약 됐는지. 좌석코드로 검색하여 확인
	    public boolean isOccupied(String seatId) {
	       int RV_OR_NOT = 0;
	      String sql = "SELECT RV_OR_NOT FROM SEATS "
	            + "WHERE SEATID = ?";
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL, user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, seatId);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            RV_OR_NOT = rs.getInt(1);
	         }
	         
	      } catch (SQLException | ClassNotFoundException e) {
	         System.out.println("[system] 여부확인 실패");
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmtRs(conn, pstmt, rs);
	      }
	      
	        return RV_OR_NOT != 0;
	    }
	   
	//   
	//   // 좌석 예약 됐는지
//	    public String isOccupied(Seat s) {
//	       String userId = null;
//	      String sql = "SELECT USERID FROM SEATS "
//	            + "WHERE SEATID =" +  ;
////	      String sql = "SELECT USERID FROM SEATS "
////	            + "WHERE ROOMID = 2 AND SEATCODE = 'A2' ";
//	      try {
//	         Class.forName(Driver);
//	         conn = DriverManager.getConnection(URL,user, pwd);
//	         pstmt = conn.prepareStatement(sql);
//	         rs = pstmt.executeQuery();
//	         
//	         while(rs.next()) {
//	            userId = rs.getString(1);
//	         }
//	         System.out.print(userId);
//	      } catch (SQLException | ClassNotFoundException e) {
//	         System.out.println("[system] 여부확인 실패");
//	         e.printStackTrace();
//	      }
//	        return userId;
//	    }

	    
	    // ID로 좌석 검색
	    // 좌석 있는 경우 좌석코드, 없으면 null 반환
	    public Seat checkSeat(String userId) {

	      String sql = "SELECT ROOMID, SEATCODE, USETIME FROM SEATS "
	            + "WHERE USERID = ? ";
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            int roomId = rs.getInt(1);
	            String seatCode = rs.getString(2);
	            int useTime = rs.getInt(3);
	            
	            Seat seat = new Seat(roomId, seatCode, userId, useTime );
	            return seat;
	            
	         } 
	         
	         
	      } catch (SQLException | ClassNotFoundException e) {
	         System.out.println("[system] 좌석확인 실패");
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmtRs(conn, pstmt, rs);
	      }
	      return null;
	    }
	    
	    
	    
	   public String checkExpireTime(String ID) {
	      String expTime = null;
	      
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         String sql = "SELECT EXPTIME FROM SEATS "
	               + "WHERE USERID = ? ";
	         
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, ID);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            expTime = rs.getString(1);
	         }
	         
	         
	      } catch (SQLException | ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmtRs(conn, pstmt, rs);
	      }
//	      DateFormat format = new SimpleDateFormat("hh:mm:ss a");
	      return expTime;
	   }






	   public List<Integer> isRowOccupied(int roomId, String row) {
	      // 한 행 읽어옴
	      List<Integer> col = new ArrayList<>();
	      String sql = "SELECT RV_OR_NOT FROM SEATS "
	            + "WHERE ROOMID = ? AND SEATCODE LIKE ?||'%' ";
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, roomId);
	         pstmt.setString(2, row);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            int RV_OR_NOT = rs.getInt(1);
	            col.add(RV_OR_NOT);
	         } 
	         
	         
	      } catch (SQLException | ClassNotFoundException e) {
	         System.out.println("[system] 좌석확인 실패");
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmtRs(conn, pstmt, rs);
	      }
	      return col;
	   }
	   
	    
	   
	   // 예약시간 만료됐는지 확인
	   // seats 테이블에서
	         // RV_OR_NOT 값이 1인 것들을 대상으로
	         // 현재시간 - EXP_DATE 계산하여
	         // 음수라면
	         // RV_OR_NOT 값을 0으로 바꾼다
	   public int expireOrNot() {
	      int result = 0;
	      String sql = "UPDATE SEATS SET USERID = NULL, RV_OR_NOT = 0 "
	            + "WHERE SYSDATE > EXPTIME";
	      
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[system] 만료된 좌석 처리 실패");
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmt(conn, pstmt);
	      }
	      
	      return result;
	   }
	   
	   
	   public int socialDistanceMode(int roomId) {
	      int result = 0;
	      String sql = "UPDATE SEATS SET RV_OR_NOT = 1 "
	            + "   WHERE MOD(SUBSTR(SEATCODE,2),2) = 0"
	            + "     AND ROOMID = ? ";
	      
	      try {
	         Class.forName(Driver);
	         conn = DriverManager.getConnection(URL,user, pwd);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, roomId);
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[system] 사회적 거리두기모드 실패");
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         JDBC_Close.closeConnStmt(conn, pstmt);
	      }
	      System.out.println("거리두기를 성공적으로 적용하였습니다.");
	      return result;
	   }
	   
	// 마이페이지 접속->열람실 예약내역(id접속)
		public List<Seat> mypageSeat(String id) {

			List<Seat> list = null;

			try {
				conn = DriverManager.getConnection(URL, user, pwd);
				StringBuilder sb = new StringBuilder();
				sb.append(" SELECT * FROM SEATS WHERE USERID = ? ");

				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();

				list = new ArrayList<Seat>();
				while (rs.next()) {
					list.add(new Seat(rs.getString("SEATCODE"), rs.getInt("ROOMID"), rs.getString("EXPTIME")));

				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBC_Close.closeConnStmtRs(conn, pstmt, rs);
			}

			return list;
		}
	   

	   
	   
	   
	}