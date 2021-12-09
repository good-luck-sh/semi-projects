package vo;

/**
 * 페이징처리를 지원하는 클래스다.<p>
 * <ul>
 * 	<li>현재 페이지번호</li>
 * 	<li>현재 블록번호</li>
 * 	<li>총 데이터 갯수</li>
 * 	<li>총 페이지 갯수</li>
 * 	<li>총 블록 갯수</li>
 * 	<li>현재 블록의 시작 페이지번호</li>
 * 	<li>현재 블록의 끝 페이지번호</li>
 * 	<li>이전 블록의 페이지번호</li>
 * 	<li>다음 블록의 페이지번호</li>
 * 	<li>데이터조회 시작 순번</li>
 * 	<li>데이터조회 끝 순번</li>
 * <ul>
 * @author 김승희
 *
 */
public class PaginationBoard {

	private int rowsPerPage = 5; // 한 페이지당 표시할 데이터의 갯수
	private int pagesPerBlock = 5; // 한 블록당 표시할 페이지번호 숫자
	private int currentPageNo; // 현재 페이지번호
	private int totalRecords; // 총 데이터 갯수
	private int totalPages; // 총 페이지 갯수
	private int totalBlocks; // 총 페이지블록 갯수
	private int currentBlock; // 현재 페이지 번호에 해당하는 현재 블록 번호
	private int beginPage; // 현재 블록번호에 해당하는 시작 페이지 번호
	private int endPage; // 현재 블록번호에 해당하는 끝 페이지 번호
	private int prevPage; // 이전 블록의 페이지번호
	private int nextPage; // 다음 블록의 페이지번호
	private int begin; // 현재 페이지번호에 해당하는 데이터 조회 시작 순번
	private int end; // 현재 페이지번호에 해당하는 데이터 조회 끝 순번

	/**
	 * 페이지번호와 총 데이터 갯수를 전달받아서 Pagination객체를 초기화한다.
	 * <p>
	 * 페이징처리에 필요한 모든 값을 계산해서 멤버변수에 저장한다.
	 * 
	 * @param pageNo       요청한 페이지 번호
	 * @param totalRecords 총 데이터 갯수
	 */
	public PaginationBoard(String pageNo, int totalRecords) {
		// 총 페이지 갯수를 계산해서 멤버변수 totalPages에 대입한다.
		totalPages = (int) (Math.ceil((double) totalRecords / rowsPerPage));
		// 총 블록 갯수를 계산해서 멤버변수 totalBlocks에 대입한다.
		totalBlocks = (int) (Math.ceil((double) totalPages / pagesPerBlock));

		// 현재 페이지번호를 계산한다.
		currentPageNo = 1;
		try {
			currentPageNo = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}

		if (currentPageNo <= 0) { // 숫자로 변환된 현재 페이지번호가 0이거나 0보다 작으면 현재 페이지번호를 1로 설정한다.
			currentPageNo = 1;
		}
		if (currentPageNo > totalPages) { // 숫자로 변환된 현재 페이지번호가 총 페이지갯수 보다 크면 현재 페이지번호를 totalPages로 설정한다.
			currentPageNo = totalPages;
		}
		// 현재 페이지번호에 해당하는 데이터조회 시작 순번과 끝 순번을 계산해서 멤버변수에 대입한다.
		begin = (currentPageNo - 1) * rowsPerPage + 1;
		end = currentPageNo * rowsPerPage;

		if (totalPages != 0) {
			// 현재 페이지번호에 대한 현재 블록번호를 계산해서 멤버변수에 대입한다.
			currentBlock = (int) (Math.ceil((double) currentPageNo / pagesPerBlock));
			// 현재 블록 번호에 해당하는 시작페이지번호와 끝페이지번호를 계산해서 멤버변수에 대입한다.
			beginPage = (currentBlock - 1) * pagesPerBlock + 1;
			endPage = currentBlock * pagesPerBlock;
			if (currentBlock == totalBlocks) {
				endPage = totalPages;
			}
	
			// 현재 페이지번호에 대한 이전 블록의 페이지번호를 계산해서 멤버변수에 대입한다.
			if (currentBlock > 1) {
				prevPage = (currentBlock - 1) * pagesPerBlock;
			}
			// 현재 페이지번호에 대한 다음 블록의 페이지번호를 계산해서 멤버변수에 대입한다.
			if (currentBlock < totalBlocks) {
				nextPage = currentBlock * pagesPerBlock + 1;
			}
		}
	}

	/**
	 * 계산된 현재 페이지번호를 반환한다.
	 * 
	 * @return 페이지번호
	 */
	public int getPageNo() {
		return currentPageNo;
	}

	/**
	 * 총 게시글 갯수를 반환한다.
	 * 
	 * @return 총 게시글 갯수
	 */
	public int getTotalRecords() {
		return totalRecords;
	}

	/**
	 * 총 페이지 갯수를 반환한다.
	 * 
	 * @return 총 페이지 갯수
	 */
	public int getTotalPages() {
		return totalPages;
	}

	/**
	 * 시작 페이지번호를 반환한다.
	 * 
	 * @return 시작 페이지번호
	 */
	public int getBeginPage() {
		return beginPage;
	}

	/**
	 * 끝 페이지번호를 반환한다.
	 * 
	 * @return 끝 페이지번호
	 */
	public int getEndPage() {
		return endPage;
	}

	/**
	 * 조회 시작 순번을 반환한다.
	 * 
	 * @return 조회 시작 순번
	 */
	public int getBegin() {
		return begin;
	}

	/**
	 * 이전 블록의 페이지번호를 반환한다.
	 * 
	 * @return 페이지번호
	 */
	public int getPrevPage() {
		return prevPage;
	}

	/**
	 * 이전 블록 존재여부를 반환한다.
	 * 
	 * @return 이전 블록 존재 여부
	 */
	public boolean isExistPrev() {
		if (totalBlocks == 1) {
			return false;
		}
		return currentBlock > 1;
	}

	/**
	 * 다음 블록 존재여부를 반환한다.
	 * 
	 * @return 다음 블록 존재 여부
	 */
	public boolean isExistNext() {
		if (totalBlocks == 1) {
			return false;
		}

		return currentBlock < totalBlocks;
	}

	/**
	 * 다음 블록의 페이지번호를 반환한다.
	 * 
	 * @return 페이지번호
	 */
	public int getNextPage() {
		return nextPage;
	}

	/**
	 * 조회 끝 순번을 반환한다.
	 * 
	 * @return 조회 끝 순번
	 */
	public int getEnd() {
		return end;
	}

}