package vo;

import java.util.Date;

public class CsBoard {

	private int csBoardNo;
	private String csBoardTitle;
	private UserTable userTable;
	private int csBoardViewCount;
	private int csBoardLikeCount;
	private String csBoardContent;
	private Date csCreateDate;
	private Date csUpdateDate;
	private Date csDeletedDate;
	private String csReplyContent;
	private Date csReplyCreateDate;
	private String csReplyCheck;
	
	public CsBoard() {}

	public int getCsBoardNo() {
		return csBoardNo;
	}

	public void setCsBoardNo(int csBoardNo) {
		this.csBoardNo = csBoardNo;
	}

	public String getCsBoardTitle() {
		return csBoardTitle;
	}

	public void setCsBoardTitle(String csBoardTitle) {
		this.csBoardTitle = csBoardTitle;
	}

	public UserTable getUserTable() {
		return userTable;
	}

	public void setUserTable(UserTable userTable) {
		this.userTable = userTable;
	}

	public int getCsBoardViewCount() {
		return csBoardViewCount;
	}

	public void setCsBoardViewCount(int csBoardViewCount) {
		this.csBoardViewCount = csBoardViewCount;
	}

	public int getCsBoardLikeCount() {
		return csBoardLikeCount;
	}

	public void setCsBoardLikeCount(int csBoardLikeCount) {
		this.csBoardLikeCount = csBoardLikeCount;
	}

	public String getCsBoardContent() {
		return csBoardContent;
	}

	public void setCsBoardContent(String csBoardContent) {
		this.csBoardContent = csBoardContent;
	}

	public Date getCsCreateDate() {
		return csCreateDate;
	}

	public void setCsCreateDate(Date csCreateDate) {
		this.csCreateDate = csCreateDate;
	}

	public Date getCsUpdateDate() {
		return csUpdateDate;
	}

	public void setCsUpdateDate(Date csUpdateDate) {
		this.csUpdateDate = csUpdateDate;
	}

	public Date getCsDeletedDate() {
		return csDeletedDate;
	}

	public void setCsDeletedDate(Date csDeletedDate) {
		this.csDeletedDate = csDeletedDate;
	}

	public String getCsReplyContent() {
		return csReplyContent;
	}

	public void setCsReplyContent(String csReplyContent) {
		this.csReplyContent = csReplyContent;
	}

	public Date getCsReplyCreateDate() {
		return csReplyCreateDate;
	}

	public void setCsReplyCreateDate(Date csReplyCreateDate) {
		this.csReplyCreateDate = csReplyCreateDate;
	}

	public String getCsReplyCheck() {
		return csReplyCheck;
	}

	public void setCsReplyCheck(String csReplyCheck) {
		this.csReplyCheck = csReplyCheck;
	}
	
	
}
