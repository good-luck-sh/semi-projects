package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static utils.ConnectionUtil.getConnection;
import vo.Categorys;

public class CategoryDao {
	
	public int overlappingCategorysName(Categorys categorys) throws SQLException {
		String sql = "select count(*) as cnt "
					+"from categorys "
					+"where categorys_name = ? ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, categorys.getCategorysName());
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0; 
		while(rs.next()) {
			result = rs.getInt("cnt");
		}
		pstmt.close();
		connection.close();
		return result;
	}
	
	/**
	 * 새로운 카테고리를 등록한다. 
	 * @param categorys
	 * @throws SQLException
	 */
	public void insertCategorys(Categorys categorys) throws SQLException {
		String sql = "insert into categorys (categorys_no, categorys_name) "
					+"values (categorys_no.nextval, ?) ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, categorys.getCategorysName());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 모든 카테고리 정보 반환
	 * @return 카테고리정보 목록
	 * @throws SQLException
	 */
	public List<Categorys> selectAllCategorys() throws SQLException {
		List<Categorys> categorys = new ArrayList<>();
		String sql = "select categorys_no, categorys_name "
					+"from categorys "
					+"order by categorys_no asc ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Categorys category = new Categorys();
			category.setCategorysNo(rs.getInt("categorys_no"));
			category.setCategorysName(rs.getString("categorys_name"));
			
			categorys.add(category);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return categorys;
	}
	
	
	/**
	 * 선택한 카테고리 번호에 해당하는 카테고리 정보 반환
	 * @param categorysNo 카테고리번호
	 * @return 해당 카테고리 정보
	 * @throws SQLException
	 */
	public Categorys selectCategoryByNo(int categorysNo) throws SQLException {
		Categorys categorys = null;
		
		String sql = "select categorys_no, categorys_name "
				   + "from categorys "
				   + "where categorys_no = ? ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, categorysNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			categorys = new Categorys();
			categorys.setCategorysNo(rs.getInt("categorys_no"));
			categorys.setCategorysName(rs.getString("categorys_name"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return categorys;
	}
	
	
	
	
	
	
	
	
	
	
	

}
