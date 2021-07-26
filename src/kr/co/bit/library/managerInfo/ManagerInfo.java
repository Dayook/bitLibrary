package kr.co.bit.library.managerInfo;

public class ManagerInfo {
	
	private String managerId;
	private String managerPw;
	
	
	public ManagerInfo(String managerId, String managerPw) {
		this.managerId = managerId;
		this.managerPw = managerPw;
	}
	
	
	public String getManagerId() {
		return managerId;
	}
//	public void setManagerId(String managerId) {
//		this.managerId = managerId;
//	}

	public String getManagerPw() {
		return managerPw;
	}
	public void setManagerPw(String managerPw) {
		this.managerPw = managerPw;
	}
	

}
