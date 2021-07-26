package kr.co.bit.library.room;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import kr.co.bit.library.seat.Seat;

public class ReadingRoom {

	// SELECT COUNT(SEATROW), COUNT(SEATCOL) FROM SEAT
	private int roomId;
	private String roomName;
	private int useTime;
	private int rowCount;
	private int colCount;
	private int seatCount;
//	private Seat[][] seats;

	public ReadingRoom(int roomId, String roomName, int rowCount, int colCount) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.rowCount = rowCount;
		this.colCount = colCount;
		this.seatCount = rowCount * colCount;

		// 콘솔 출력용 seat 행렬 만들기
//		seats = new Seat[rowCount][colCount];
//		for (int i = 0; i < rowCount; i++) {
//			for (int j = 0; j < colCount; j++) {
//				seats[i][j] = new Seat();
//
//			}
//		}
	}

	public ReadingRoom(int roomId, String roomName, int rowCount, int colCount, int useTime) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.rowCount = rowCount;
		this.colCount = colCount;
		this.seatCount = rowCount * colCount;
		this.useTime = useTime;
	}

	@Override
	public String toString() {
		return "          [" + roomId + ". " + roomName + " 열람실]\n"

				+ " " + rowCount + "행 " + colCount + "열" + " 총 좌석 수: " + seatCount + "\n 기본 이용시간: " + useTime;
	}

	public ReadingRoom(String roomName, int rowCount, int colCount) {
		this.roomName = roomName;
		this.rowCount = rowCount;
		this.colCount = colCount;
	}

	public ReadingRoom() {
		// TODO Auto-generated constructor stub
	}

	public int getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}

	public int getRowIndex(char rowChar) {
		char row = Character.toUpperCase(rowChar);
		return (int) row - 65;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getColCount() {
		return colCount;
	}

	public void setColCount(int colCount) {
		this.colCount = colCount;
	}

}
