package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import DTO.PayDTO;

public class PayDAO {
	private static PayDAO instance;

	private static BasicDataSource bds = new BasicDataSource();

	private PayDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@o.qowmq.dev:1521:xe");
		bds.setUsername("manager");
		bds.setPassword("manager");
		bds.setInitialSize(30);	
	}

	public synchronized static PayDAO getInstance() {
		if(instance == null) {
			instance = new PayDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}
	
	public PayDTO selectAllById(String member_id) {
		String sql = "select * from payment where member_id = ?";
		
		try (Connection conn =this.getConnection();
				PreparedStatement pstat = new LoggableStatement(conn, sql)){
			pstat.setString(1, member_id);
			try(ResultSet rs = pstat.executeQuery()){
				PayDTO dto = new PayDTO();
				if(rs.next()) {
					dto.setSeq(rs.getInt("seq"));
					dto.setPoint(rs.getInt("point"));
					dto.setPayment_date(rs.getDate("payment_date"));
					dto.setApproval_num(rs.getString("approval_num"));
					dto.setCompany(rs.getString("company"));
					dto.setMember_id(rs.getString("member_id"));
				}
				return dto;
			}
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	
	}
}
