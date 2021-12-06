package dao;

import static utils.ConnectionUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AgeDto;
import dto.GenderDto;
import dto.monthDto;

public class ManagerDao {
	
	/**
	 * 주문날짜를 기준으로 월별매출 조회하기
	 * @return 월별 매출
	 * @throws SQLException
	 */
	public List<monthDto> monthlySalesCheckByOrderDate() throws SQLException {
		String sql = "select to_char(order_date, 'mm') as month, "
				+ 	 	"sum(order_total_price) as totalsales, "
				+ 	 	"sum(order_total_point) as usepoint, "
				+ 		"sum(order_real_total_price) as realsales "
				+ "from orders "
				+ "group by to_char(order_date, 'mm') "
				+ "order by to_char(order_date, 'mm') asc ";
		
		List<monthDto> orderList = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			monthDto orders = new monthDto();
			orders.setOrderDate(rs.getString("month"));
			orders.setTotalSales(rs.getInt("totalsales"));
			orders.setUsePoint(rs.getInt("usepoint"));
			orders.setRealSales(rs.getInt("realsales"));
			
			orderList.add(orders);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderList;
	}

	/**
	 * 나이별로 가입자 수 구하기
	 * @return 나이별 가입자 수
	 * @throws SQLException
	 */
	public List<AgeDto> countUsersByAge() throws SQLException {
		String sql = "select trunc(user_age, -1) as age, count(*) as cnt "
				+ "from user_table "
				+ "group by trunc(user_age, -1) ";
		
		List<AgeDto> ageList = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			AgeDto ageDto = new AgeDto();
			
			ageDto.setAge(rs.getInt("age"));
			ageDto.setCnt(rs.getInt("cnt"));
		
			ageList.add(ageDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();

		return ageList;
	}

	/**
	 * 성별로 가입자 수 구하기
	 * @return 성별 가입자 수
	 * @throws SQLException
	 */
		public List<GenderDto> countAllUsersByGender() throws SQLException {
			String sql = "select user_gender, count(*) as cnt "
					+ "from user_table "
					+ "group by user_gender ";
			
			List<GenderDto> genderList = new ArrayList<>();
			
			Connection connection = getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				GenderDto gender = new GenderDto();
				
				gender.setGender(rs.getString("user_gender"));
				gender.setCnt(rs.getInt("cnt"));
				
				genderList.add(gender);
			}
			rs.close();
			pstmt.close();
			connection.close();
			
			return genderList;
		}
		
}
