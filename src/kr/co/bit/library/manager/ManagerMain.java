package kr.co.bit.library.manager;

import java.util.Scanner;

import kr.co.bit.library.main.LibraryMain;
import kr.co.bit.library.managerInfo.ManagerLogin;
import kr.co.bit.library.room.ReadingRoomDao;
import kr.co.bit.library.seat.SeatDao;
import kr.co.bit.library.seat.SeatReservUI;

public class ManagerMain {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		ManagerUI managerUI = new ManagerUI();
		ReadingRoomDao rDao = new ReadingRoomDao();
		boolean inputSwitch = true;
		LibraryMain main = new LibraryMain();
		SeatDao sDao = new SeatDao();
		SeatReservUI sUI = new SeatReservUI();

		ManagerLogin mLogin = new ManagerLogin();
		mLogin.menagerLoginMenu();

		while (inputSwitch) {
			// 메인메뉴 출력 -1. 열람실 관리 -2. 도서 등록 -3.로그아웃
			managerUI.managerMenu();
			String choice = scanner.next();
			boolean menuSwitch = true;
			switch (choice) {
			case "1":
				// 수정! while true문에 넣음

				while (menuSwitch) {
					managerUI.managingRoomMenu();
					choice = scanner.next();
					switch (choice) {
					case "1":
						managerUI.createReadingRoom();
						break;
					case "2":
						managerUI.updateReadingRoom();
						break;
					case "3":
						managerUI.deleteReadingRoom();
						break;
					case "4":
						managerUI.socialDistanceMode();
						break;
					case "5":
						sDao.expireOrNot();
						sUI.printMatrix();
						break;
					case "6":
						menuSwitch = false;
						break;
					default:
						System.out.println("잘못 입력하셨습니다.");
						break;
					}
				}
				break;

			case "2":
				// 도서현황 관리
				while (menuSwitch) {
					managerUI.managingBookMenu();
					choice = scanner.next();
					switch (choice) {
					case "1":
						managerUI.enterBook();
						break;
					case "2":
						managerUI.modifyBookStock();
						break;
					case "3":
						managerUI.modifyBookLocation();
						break;
					case "4":
						menuSwitch = false;
						break;
					default:
						System.out.println("잘못 입력하셨습니다.");
						break;

					}

				}
				break;

			case "3":
				System.out.println("'관리자'접속을 종료합니다.");
				main.main(null);
				break;
			default:
				System.out.println("잘못 입력했습니다.");
//            inputSwitch=false;
//            managerUI.logout();
				break;
			}

		}
	}

}