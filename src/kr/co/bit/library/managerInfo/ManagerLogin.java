package kr.co.bit.library.managerInfo;

import java.util.Scanner;

import kr.co.bit.library.manager.ManagerMain;

public class ManagerLogin {

	Scanner scanner = new Scanner(System.in);
	ManagerMain managerMain = new ManagerMain();
	
	public void menagerLoginMenu() {
		
		
		while(true) {
			System.out.println("관리자 로그인");
			System.out.println("__________________________________");
			System.out.println("");
			System.out.print("관리자 아이디:");
			String mid = scanner.next();
			System.out.print("관리자 비밀번호:");
			String mpw = scanner.next();
			
			if(managerLogin(mid, mpw)) {
				System.out.println("관리자 로그인에 성공하셨습니다");
				break;// 관리자 메뉴로 이동!
			}
			System.out.println();
		}
		
		
		
		
	}
	
	
	public boolean managerLogin(String mid, String mpw) {
		ManagerInfoDao mDao = new ManagerInfoDao();
		String managerId = mDao.managerInfo().getManagerId();
		String managerPw = mDao.managerInfo().getManagerPw();
		if(mid.equals(managerId)
		&& mpw.equals(managerPw)) {
			return true;
		}
		return false;
	}
	
	
}
