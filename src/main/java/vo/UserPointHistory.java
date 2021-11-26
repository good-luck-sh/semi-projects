package vo;

import java.util.Date;

public class UserPointHistory {

	private int historyNo;
	private UserTable userTable;
	private String historyPointCheck;
	private String historyReason;
	private Date historyCreateDate;
	private int historyTotalPoint;
	
	public UserPointHistory() {}

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	public UserTable getUserTable() {
		return userTable;
	}

	public void setUserTable(UserTable userTable) {
		this.userTable = userTable;
	}

	public String getHistoryPointCheck() {
		return historyPointCheck;
	}

	public void setHistoryPointCheck(String historyPointCheck) {
		this.historyPointCheck = historyPointCheck;
	}

	public String getHistoryReason() {
		return historyReason;
	}

	public void setHistoryReason(String historyReason) {
		this.historyReason = historyReason;
	}

	public Date getHistoryCreateDate() {
		return historyCreateDate;
	}

	public void setHistoryCreateDate(Date historyCreateDate) {
		this.historyCreateDate = historyCreateDate;
	}

	public int getHistoryTotalPoint() {
		return historyTotalPoint;
	}

	public void setHistoryTotalPoint(int historyTotalPoint) {
		this.historyTotalPoint = historyTotalPoint;
	}
	
	
	
}
