package kr.co.bit.library.seat;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

import kr.co.bit.library.login.main.dao.LoginTest;
import kr.co.bit.library.main.SaveID;
import kr.co.bit.library.room.ReadingRoom;
import kr.co.bit.library.room.ReadingRoomDao;

public class SeatReservMain {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		SeatDao seatDao = new SeatDao();
		SeatReservUI seatReservUI = new SeatReservUI();
		String ID = SaveID.myId;

		if (ID != null) {
			String choice;
			boolean inputSwitch = true;
			seatDao.expireOrNot();
			seatReservUI.printMatrix();
//      seatReservUI.printSeatMatrix();
			while (inputSwitch) {

				// 좌석 현황
				// 메뉴 출력
				seatReservUI.reservMenu();
				System.out.println("__________________________________");

				choice = scanner.next();

				switch (choice) {
				case "1":
					// 좌석 예약
//            seatReservUI.hasSeat();
					try {
						seatReservUI.reserve();
					} catch (InputMismatchException e) {
						System.out.println("잘못 입력하였습니다.");
					}

					break;
				case "2":
					// 좌석 취소
					try {
						seatReservUI.cancel(ID);
					} catch (Exception e) {
						System.out.println("잘못 입력하였습니다.");
					}

					break;
				case "3":
					// 예약 연장
					try {
						seatReservUI.extend(ID);
					} catch (Exception e) {
						System.out.println("잘못 입력하였습니다.");
					}

					break;
				case "4":
					// 좌석현황 조회
					seatReservUI.printMatrix();
					break;
				case "5":
					inputSwitch = false;
					break;
				}

			}
		} else if(ID==null) {
			System.out.println("로그인 후 이용해주세요! ");
			LoginTest loginTest = new LoginTest();
			loginTest.LoginView();
		}
	}
}