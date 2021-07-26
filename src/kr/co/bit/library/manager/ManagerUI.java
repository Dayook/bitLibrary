package kr.co.bit.library.manager;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import kr.co.bit.library.book.main.dao.BookDAO;
import kr.co.bit.library.main.dto.BookDTO;
import kr.co.bit.library.room.ReadingRoom;
import kr.co.bit.library.room.ReadingRoomDao;
import kr.co.bit.library.seat.SeatDao;

public class ManagerUI {

	Scanner scanner = new Scanner(System.in);
	ReadingRoomDao rDao = new ReadingRoomDao();
	BookDAO bookDao = new BookDAO();

	public void managerMenu() {

		System.out.println("__________________________________");
		System.out.println("              관리자 모드");
		System.out.println("__________________________________");

		System.out.println("1. 열람실 관리");
		System.out.println("2. 도서현황 관리");
		System.out.println("3. 뒤로");
		System.out.print("선택>> ");

	}

	public void managingRoomMenu() {

		System.out.println("1. 열람실 생성");
		System.out.println("2. 열람실 수정");
		System.out.println("3. 열람실 삭제");
		System.out.println("4. [new] 사회적 거리두기 모드");
		System.out.println("5. 열람실 좌석표 조회");
		System.out.println("6. 뒤로");

	}

	public void managingBookMenu() {

		System.out.println("1. 책 등록하기");
		System.out.println("2. 책 재고 수정하기");
		System.out.println("3. 도서 위치 변경");
		System.out.println("4. 뒤로");

	}

	// 열람실 생성
	public boolean createReadingRoom() {
		try {
			System.out.println("열람실을 생성합니다. ");
			System.out.print("열람실 번호 >> ");
			int roomId = scanner.nextInt();
			if (rDao.selectOne(roomId) != null) {
				// roomId는 기본키이므로 중복되면 안됨
				// 중복값인 경우 false return하여 돌려보낸다
				System.out.println("이미 존재하는 열람실번호입니다.");
				return false;
			}
			System.out.print("열람실 이름 >> ");
			String roomName = scanner.next();
			System.out.print("열람실 행 >> ");
			int rowCount = scanner.nextInt();
			System.out.print("열람실 열 >> ");
			int colCount = scanner.nextInt();
			ReadingRoom r = new ReadingRoom(roomId, roomName, rowCount, colCount);
			rDao.CreateRoom(r);
			return true;
		} catch (Exception e) {
			scanner.next();
			System.out.println("잘못된 값을 입력했습니다 ");
			return false;
		}
	}

	public boolean showReadingRoom() {
		List<ReadingRoom> rList = new ArrayList<>();
		rList = rDao.selectAll();
		if (rList.size() == 0) {
			System.out.println("열람실이 존재하지 않습니다");
			return false;
		} else {
			System.out.println("열람실 정보");
			for (ReadingRoom r : rList) {
				System.out.println(r);
				System.out.println("__________________________________");
			}
			return true;
		}

	}

	public boolean updateReadingRoom() {
		try {
			// <----------열람실 전체 목록 조회로 묶기
			List<ReadingRoom> rList = new ArrayList<>();
			rList = rDao.selectAll();
			if (rList.size() == 0) {
				System.out.println("열람실이 존재하지 않습니다");
				return false;
			}

			System.out.println();
			for (ReadingRoom r : rList) {
				System.out.println(r);
			}
			// <----======여기까지----------->

			System.out.println("1. 이름 변경");
			System.out.println("2. 기본 이용시간 변경");
			System.out.println("3. 뒤로");
			String choice = scanner.next();
			switch (choice) {
			case "1":
				updateRoomName();
				break;
			case "2":
				updateUseTime();
				break;
			case "3":
				break;
			default:
				System.out.println("잘못 입력하셨습니다.");
			}
			return true;
		} catch (Exception ex) {
			System.out.println("잘못된 값을 입력했습니다 ");
			return false;
		}

	}

	public boolean updateRoomName() {
		System.out.println("수정할 열람실 번호>> ");
		int roomId = scanner.nextInt();
		System.out.print("열람실 이름 >> ");
		String roomName = scanner.next();
		rDao.updateName(roomId, roomName);

		return true;
	}

	public void updateUseTime() {
		ReadingRoomDao rDao = new ReadingRoomDao();
		System.out.println("열람실 기본 이용시간을 변경합니다.");
		System.out.println("변경할 열람실 번호 >>");
		int roomId = scanner.nextInt();
		System.out.print("시간을 입력하세요(단위:시간)>> ");
		int useTime = scanner.nextInt();
		System.out.println(rDao.managingUseTime(roomId, useTime) + "건 변경하였습니다.");
		// 트리거 만들기
		// room의 usetime 변경되면

	}

	// 열람실 삭제
	public boolean deleteReadingRoom() {
		try {
			// <---------메소드로 묶으면 좋을텐데--__>
			List<ReadingRoom> rList = new ArrayList<>();
			rList = rDao.selectAll();
			if (rList.size() == 0) {
				System.out.println("열람실이 존재하지 않습니다");
				return false;
			}

			System.out.println();
			for (ReadingRoom r : rList) {
				System.out.println(r);
			}
			// <---------어떻게 묶을지 모르게ㅅ다--__>

			System.out.println("1. 전체삭제 ");
			System.out.println("2. 선택삭제 ");
			System.out.println("3. 뒤로 ");
			System.out.println(">> ");
			String choice = scanner.next();
			switch (choice) {
			case "1":
				System.out.println("정말 전체 삭제하시겠습니까? Y/N");
				String dChoice = scanner.next();
				if (dChoice.equals("Y") || dChoice.equals("y")) {
					rDao.deleteAll();
					System.out.println("전체 삭제하였습니다");
				} else {
					System.out.println("삭제하지 않습니다");
				}
				break;
			case "2":
				System.out.println("삭제할 열람실 번호를 입력해주세요. ");
				System.out.print("열람실 번호 >> ");
				int roomId = scanner.nextInt();
				System.out.println(rDao.deleteOne(roomId) + "건 삭제하였습니다.");
				;
				break;
			case "3":
				break;
			default:
				System.out.println("잘못 입력하셨습니다.");
				break;
			}
			return true;
		} catch (Exception ex) {

			System.out.println("[system error]");
			return false;
		}
	}

	public void enterBook() {
		try {
			System.out.println("입력할 책 정보를 기입해주세요.");
			System.out.print("연번 >>>");
			int serialNumber = scanner.nextInt();
			System.out.print("청구기호 >>>");
			String callNumber = scanner.next();
			System.out.print("자료실 위치 >>>");
			String location = scanner.next();
			System.out.print("서명 >>>");
			String bookName = scanner.next();
			System.out.print("저자명 >>>");
			String author = scanner.next();

			System.out.print("출판사 >>>");
			String publisher = scanner.next();

			System.out.print("발행연 >>>");
			int year = scanner.nextInt();

			System.out.print("재고 >>>");
			int stock = scanner.nextInt();

			BookDTO book = new BookDTO(serialNumber, callNumber, location, bookName, author, publisher, year, stock);

			bookDao.insertBook(book);

		} catch (Exception e) {
			scanner.next();
			System.out.println("[System] 잘못 입력하셨습니다.");
		}

	}

	public void modifyBookStock() {
		try {
			System.out.println("재고 수정할 책 정보를 기입해주세요.");
			System.out.print("연번 >>>");
			int serialNumber = scanner.nextInt();
			System.out.print("재고 >>>");
			int stock = scanner.nextInt();

			bookDao.modifyBookStock(serialNumber, stock);

		} catch (Exception e) {
			scanner.next();
			System.out.println("[System] 잘못 입력하셨습니다.");
			System.out.println("[System] 정수값을 입력해주세요.");

		}

	}

	public void modifyBookLocation() {
		try {
			System.out.println("위치 수정할 책 정보를 기입해주세요.");
			System.out.print("연번 >>>");
			int serialNumber = scanner.nextInt();
			System.out.print("자료실 위치 >>>");
			String location = scanner.next();

			bookDao.modifyBookLocation(serialNumber, location);
		} catch (Exception e) {
			scanner.next();
			System.out.println("[system] 잘못 입력하셨습니다.");
		}

	}

	public void logout() {
		// 로그out

	}

	public void socialDistanceMode() {
		// TODO Auto-generated method stub
		// col이 짝수인 좌석은 rv_or_not을 1로 바꿔버린다
		// seat 하나씩 체크하면 너무 느리다
		// DB에서 하는 게 맞다
		try {
			System.out.println("거리두기 적용할 열람실 번호를 입력해주세요.");
			System.out.println(">>>");
			int roomId = scanner.nextInt();

			SeatDao sDao = new SeatDao();
			sDao.socialDistanceMode(roomId);
		} catch (Exception e) {
			scanner.next();
			System.out.println("잘못 입력하셨습니다.");

		}

	}

}