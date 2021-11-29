package vo;

import java.util.Date;

public class NoticeBoard {

	private int booardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	
	public NoticeBoard() {}

	public int getBooardNo() {
		return booardNo;
	}

	public void setBooardNo(int booardNo) {
		this.booardNo = booardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
