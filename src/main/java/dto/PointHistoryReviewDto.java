package dto;

import java.util.Date;

import vo.UserTable;

public class PointHistoryReviewDto {

	private int historyNo;
	private UserTable userTable;
	private String historyPointCheck;
	private String historyReason;
	private Date historyCreateDate;
	private int historyTotalPoint;
	private int reviewNo;
	private String reviewTitle;
	private int reviewReviewLikeCount;
	private String reviewContent;
	private Date reviewCreatedDate;
	private int reviewStarPoint;
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
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public int getReviewReviewLikeCount() {
		return reviewReviewLikeCount;
	}
	public void setReviewReviewLikeCount(int reviewReviewLikeCount) {
		this.reviewReviewLikeCount = reviewReviewLikeCount;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewCreatedDate() {
		return reviewCreatedDate;
	}
	public void setReviewCreatedDate(Date reviewCreatedDate) {
		this.reviewCreatedDate = reviewCreatedDate;
	}
	public int getReviewStarPoint() {
		return reviewStarPoint;
	}
	public void setReviewStarPoint(int reviewStarPoint) {
		this.reviewStarPoint = reviewStarPoint;
	}
	
	
	
}
