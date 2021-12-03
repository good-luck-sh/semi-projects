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

public class ManagerDao {

	/**
	 * 나이별로 가입자 수 구하기
	 * @return
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
	 * @return
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
