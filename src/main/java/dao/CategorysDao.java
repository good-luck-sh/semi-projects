package dao;

import static utils.ConnectionUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtil;
import vo.Categorys;

public class CategorysDao {

	/**
	 * 모든 카테고리 정보를 반환한다.
	 * @return 카테고리 정보 목록
	 * @throws SQLException
	 */
	public List<Categorys> selectAllCategories() throws SQLException {
		List<Categorys> categoryList = new ArrayList<>();
		
		String sql = "select categorys_no, categorys_name "
				+ "from categorys "
				+ "order by categorys_no asc ";

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Categorys category = new Categorys();
			category.setCategorysNo(rs.getInt("categorys_no"));
			category.setCategorysName(rs.getString("categorys_name"));
			
			categoryList.add(category);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return categoryList;
	}

	/**
	 * 카테고리 번호에 해당하는 상품정보를 반환한다.
	 * @param categoryNo
	 * @return
	 * @throws SQLException
	 */
	public Categorys selectCategoryByNo(int categorysNo) throws SQLException {
		Categorys category = null;
		
		String sql = "select categorys_no, categorys_name "
				+ "from categorys "
				+ "where categorys_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, categorysNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			category = new Categorys();
			category.setCategorysNo(rs.getInt("categorys_no"));
			category.setCategorysName(rs.getString("categorys_name"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return category;
	}
}
