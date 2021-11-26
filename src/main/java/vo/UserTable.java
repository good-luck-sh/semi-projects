package vo;

import java.util.Date;

public class UserTable {

	private int userNo;
	private String userId;
	private String userPassword;
	private String userName;
	private int userAge;
	private String userGender;
	private String userAddress;
	private int userOrderPoint;
	private String userDegree;
	private Date userCreateDate;
	private String ManagerCheck;
	private String userDeleteCheck;
	
	public UserTable() {}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getUserOrderPoint() {
		return userOrderPoint;
	}

	public void setUserOrderPoint(int userOrderPoint) {
		this.userOrderPoint = userOrderPoint;
	}

	public String getUserDegree() {
		return userDegree;
	}

	public void setUserDegree(String userDegree) {
		this.userDegree = userDegree;
	}

	public Date getUserCreateDate() {
		return userCreateDate;
	}

	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}

	public String getManagerCheck() {
		return ManagerCheck;
	}

	public void setManagerCheck(String managerCheck) {
		ManagerCheck = managerCheck;
	}

	public String getUserDeleteCheck() {
		return userDeleteCheck;
	}

	public void setUserDeleteCheck(String userDeleteCheck) {
		this.userDeleteCheck = userDeleteCheck;
	}
	
	
}
