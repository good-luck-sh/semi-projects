package vo;

import java.util.Date;

public class Review {

	private int reviewNo;
	private String reviewTitle;
	private UserTable userTable;
	private int reviewReviewLikeCount;
	private String reviewContent;
	private Date reviewCreatedDate;
	private int reviewStarPoint;
	
	public Review() {}

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

	public UserTable getUserTable() {
		return userTable;
	}

	public void setUserTable(UserTable userTable) {
		this.userTable = userTable;
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
