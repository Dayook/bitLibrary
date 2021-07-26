package kr.co.bit.library.seat;

import java.util.List;
import java.util.Scanner;

import kr.co.bit.library.main.SaveID;
import kr.co.bit.library.room.ReadingRoom;
import kr.co.bit.library.room.ReadingRoomDao;

public class SeatReservUI {
	Scanner scanner = new Scanner(System.in);
	ReadingRoomDao rDao = new ReadingRoomDao();
	SeatDao seatDao = new SeatDao();
	String ID = SaveID.myId;

	/*
	 * 1. 열람실 좌석 매트릭스 출력 2. 좌석 예약/연장/취소 메뉴 출력
	 * 
	 * 3. 좌석 예약 4. 좌석 연장 5. 좌석 취소
	 * 
	 */
	public void printMatrix() {

		// seats 테이블에서
		// RV_OR_NOT 값이 1인 것들을 대상으로
		// 현재시간 - EXP_DATE 계산하여
		// 음수라면
		// RV_OR_NOT 값을 0으로 바꾼다

		List<ReadingRoom> rList = rDao.selectAll();
		for (ReadingRoom r : rList) {
			printRowMatix(r);
		}
		System.out.println("         □:예약가능  ■: 예약 불가능 ");
		System.out.println();
	}

	public void printRowMatix(ReadingRoom r) {

		String roomName = r.getRoomName();
		int roomId = r.getRoomId();
		int colCount = r.getColCount();
		int rowCount = r.getRowCount();
		System.out.println();
		System.out.println("             " + roomId + ". [" + roomName + "] 열람실");
		System.out.println();
		System.out.print("            ");
		for (int i = 1; i <= colCount; i++) {
			System.out.print(" " + i);
		}
		System.out.println();
		for (int i = 0; i < rowCount; i++) {
			String row = String.valueOf((char) ('A' + i));
			System.out.print("          ");
			System.out.print(row + ": ");
			for (int j : seatDao.isRowOccupied(roomId, row)) {
				if (j == 1) {
					System.out.print("■ ");
				} else {
					System.out.print("□ ");
				}
			}
			System.out.println();

		}
		System.out.println();
		System.out.println("_________________________________________");

	}

	public static void printSeatMatrix() {

		ReadingRoomDao roomDao = new ReadingRoomDao();
		SeatDao seatDao = new SeatDao();

		List<ReadingRoom> rList = roomDao.selectAll();
//      List<Integer> idList;
//      
//      for(ReadingRoom r : rList) {
//         int roomId = r.getRoomId();
//         idList.add(roomId);
//      }

		for (ReadingRoom r : rList) {

			System.out.println("     [" + r.getRoomName() + "] 좌석 조회");
			System.out.println("_________________________________________");
			System.out.print("            ");
			for (int i = 1; i <= r.getColCount(); i++) {
				System.out.print(" " + i);
			}
			System.out.println();
			String roomId = Integer.toString(r.getRoomId());
			for (int i = 0; i < r.getRowCount(); i++) {
				char row = (char) ('A' + i);
				System.out.print("          ");
				System.out.print(row + ": ");
				for (int j = 0; j < r.getColCount(); j++) {
					String seatId = roomId + row + (j + 1);
					if (seatDao.isOccupied(seatId)) {
						System.out.print("■ ");
					} else {
						System.out.print("□ ");
					}
				}
				System.out.println();
			}
			System.out.println("_________________________________________");

		}

	}

	// 2. 메뉴 출력
	public void reservMenu() {
		System.out.println("1. 좌석 예약");
		System.out.println("2. 좌석 취소");
		System.out.println("3. 예약 연장");
		System.out.println("4. 전체좌석 조회");
		System.out.println("5. 종료하기");
	}

//   public boolean hasSeat(){
//      SeatDao seatDao = new SeatDao();
//      Seat s = seatDao.checkSeat(SaveId.myId);
//      // 좌석이 null이 아니라면. 
//      if(s != null) {
//         System.out.println("1인당 한 좌석만 예약 가능합니다.");
//         System.out.println("예약된 좌석: " + s);
//         return false;
//      };
//      // 
//      System.out.println(s);
//      return true;
//   }

	// 3. 좌석 에약
	public boolean reserve() {

		SeatDao seatDao = new SeatDao();
		Seat s = seatDao.checkSeat(ID);
		// 좌석이 null이 아니라면.
		if (s != null) {
			System.out.println("1인당 한 좌석만 예약 가능합니다.");
			System.out.println("예약된 좌석: " + s);
			return false;
		}
		try {
			System.out.println("예약할 좌석의 정보를 입력해주세요.");
			System.out.print("열람실 번호>>");
			int roomId = scanner.nextInt();
			System.out.println("좌석 코드 >> ");
			String seatCode = scanner.next();

			char seatRow = toUpperCase(seatCode.charAt(0));
			char col = seatCode.charAt(1);
			int seatCol = Character.getNumericValue(col);

//			System.out.println(seatRow);
//			System.out.println(seatCol);

//         System.out.println("좌석 코드 >>> ");
//         String seatCode = scanner.next();
//         System.out.print("행>>");
//         // 스캔하고 대문자로 변환
//         char seatRow = scanner.next().charAt(0);
//         seatRow = toUpperCase(seatRow);
//         System.out.print("열>>");
//         int seatCol = scanner.nextInt();

			// 좌석이 존재하는지 확인
			// ROOMID가 있고
			// seatRow < rowCount
			// seatCol < colCount면 됨
			// 이 방법 사용할 시 ROOMDAO.SELECTALL하여 ROOM전체를 조회해야한다

			// 아니면 전체 seatid를 조회해서 그 안에 있는지 확인
			// roomId+seatRow+seatCol 이
			// SELECT SEATID FROM SEAT WHERE SEATID = ?
			// 이 방법 사용 시 SEATDAO.SELECTSEATID 하여 SEAT전체를 조회해야한다
			if (!seatExists(roomId, seatRow, seatCol)) {
				System.out.println("존재하지 않는 좌석입니다");
				System.out.println("좌석정보를 확인하세요");
				return false;
			}

			// 입력받은 정보를 통해 좌석 생성
			Seat seat = new Seat(roomId, ID, seatRow, seatCol);
			String seatId = "" + roomId + seatRow + seatCol;
			// 예약되지 않은 좌석인 경우 예약합니다
			if (seatDao.isOccupied(seatId)) {
				System.out.println("예약할 수 없는 좌석입니다.");
				return false;
			} else {
				seatDao.reserve(seat);
				System.out.printf("%c%d석이 성공적으로 예매되었습니다.\n", seatRow, seatCol);
			}

		} catch (Exception e) {
			scanner.next();
			System.out.println("잘못 입력하셨습니다");
			return false;
		}

		return true;

	}

	public char toUpperCase(char c) {
		return Character.toUpperCase(c);
	}

	public boolean seatExists(int roomId, char seatRow, int seatCol) {

		ReadingRoomDao rDao = new ReadingRoomDao();
		List<ReadingRoom> rList = rDao.selectAll();
		for (ReadingRoom r : rList) {
			if (r.getRoomId() == roomId && seatRow - 64 <= r.getRowCount() && seatCol <= r.getColCount()) {
				return true;
			}
		}
		return false;
	}

	public boolean extend(String ID) {

		SeatDao seatDao = new SeatDao();

		// 좌석 있는지 확인
		// 좌석 없으면 메소드 종료
		// 좌석 있으면 좌석코드 보여줌
		Seat s = seatDao.checkSeat(ID);
		if (s == null) {
			System.out.println("예약된 좌석이 없습니다.");
			return false;
		} else {
			System.out.println("    [예약된 좌석] ");
			System.out.println("    " + s);
			System.out.println();
		}

		// 남은 시간 확인
		System.out.print("");
		System.out.println("    [이용가능시간]");
		System.out.println(seatDao.checkExpireTime(ID));
		System.out.println();

		System.out.println("연장하시겠습니까? Y/N");
		String choice = scanner.next();
		int useTime = s.getUseTime();
		if (choice.equals("Y") || choice.equals("y")) {
			seatDao.extend(ID, useTime);
			System.out.println("        이용가능시간");
			System.out.println(seatDao.checkExpireTime(ID));
		} else if (choice.equals("N") || choice.equals("n")) {
			System.out.println("취소하였습니다.");
		} else {
			System.out.println("잘못 입력하였습니다.");
		}

		// 연장 후 남은시간 보여줌

		return true;
	}

	public boolean cancel(String ID) {
		SeatDao seatDao = new SeatDao();
		Seat s = seatDao.checkSeat(SaveID.myId);

		if (s == null) {
			System.out.println("[!!] 예약된 좌석이 없습니다");
			return false;
		} else {
			System.out.println("예약된 좌석: " + s);
		}
		System.out.println("취소하시겠습니까? Y/N");
		String choice = scanner.next();
		if (choice.equals("Y") || choice.equals("y")) {
			seatDao.cancel(ID);
		} else if (choice.equals("N") || choice.equals("n")) {
			System.out.println("취소하지 않았습니다.");

		} else {
			System.out.println("잘못 입력했습니다.");
		}

		return true;
	}

}