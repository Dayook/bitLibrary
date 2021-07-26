package kr.co.bit.library.seat;
public class Seat {
	private int roomId;
	private char seatRow;
	private int seatCol;
	private int useTime;
	private String seatId;
	private String seatCode;
	private String userId;
	private String expTime;
	
	



	public Seat() {
		
	}
	
	
	
	public Seat( String seatCode, int roomId, String expTime) {
		super();
		this.roomId = roomId;
		this.seatCode = seatCode;
		this.expTime = expTime;
	}



	public Seat(int roomId, char seatRow, int seatCol) {

		this.roomId = roomId;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.seatCode = Character.toString(seatRow) + seatCol;
		this.seatId = roomId + Character.toString(seatRow) + seatCol;

	}
	
	public Seat(int roomId, String userId, char seatRow, int seatCol) {
		super();
		this.roomId = roomId;
		this.userId = userId;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.seatCode = Character.toString(seatRow) + seatCol;

	}

	public Seat(int roomId, String seatCode, String userId) {
		this.roomId = roomId;
		this.seatCode = seatCode;
		this.userId = userId;
		
		
	}
	
	public Seat(int roomId, String seatCode, String userId, int useTime) {
		this.roomId= roomId;
		this.seatCode = seatCode;
		this.userId = userId;
		this.useTime = useTime;
	}
	
	

	@Override
	public String toString() {
		return roomId + "열람실 "+seatCode+"석";
	}

	public int getRoomId() {
		return roomId;
	}


	public char getSeatRow() {
		return seatRow;
	}

	public String getSeatId() {
		return seatId;
	}

	public int getSeatCol() {
		return seatCol;
	}

	public int getUseTime() {
		return useTime;
	}


	public String getSeatCode() {
		return seatCode;
	}


	public String getUserId() {
		return userId;
	}


	public String getExpTime() {
		return expTime;
	}

	


}