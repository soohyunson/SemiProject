package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import DTO.PaymentDTO;
import oracle.net.aso.p;

public class PaymentDAO {
	private static PaymentDAO instance;

	private static BasicDataSource bds = new BasicDataSource();

	private PaymentDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@o.qowmq.dev:1521:xe");
		bds.setUsername("semi");
		bds.setPassword("semi");
		bds.setInitialSize(30);	
	}

	public synchronized static PaymentDAO getInstance() {
		if(instance == null) {
			instance = new PaymentDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	public List<PaymentDTO> selectById(String id) throws Exception{
		//String sql = "select * from payment where member_id =?";
		String sql = "select to_char(payment_date, 'yyyy-MM-dd'), seq, point, receipt_Id, company, member_id "
				+ "from payment where member_id = ? order by 1 desc";

		try(Connection conn = this.getConnection();
				PreparedStatement pstat = new LoggableStatement(conn, sql);
				){
			pstat.setString(1, id);
			System.out.println(((LoggableStatement)pstat).getQueryString());
			try(ResultSet rs = pstat.executeQuery()){
				List<PaymentDTO> list = new ArrayList<>();
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO(
							rs.getInt("seq"),
							rs.getInt("point"),
							//rs.getDate("payment_date"),
							rs.getString(1),
							rs.getString("receipt_Id"),
							rs.getString("company"),
							rs.getString("member_id"));
					list.add(dto);
				}
				return list;
			}
		}
	}	
	
	public int insertAll(PaymentDTO dto) throws Exception{
		String sql ="insert into payment values(payment_seq.nextval, ?, sysdate, ?, ?, ?)";
		
		try(Connection conn = this.getConnection();
			PreparedStatement pstat = new LoggableStatement(conn, sql);){
			pstat.setInt(1, dto.getPoint());
			pstat.setString(2, dto.getReceipt_id());
			pstat.setString(3, dto.getCompany());
			pstat.setString(4, dto.getMember_id());
			
			System.out.println(((LoggableStatement)pstat).getQueryString());
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public PaymentDTO selectByreceipt_Id(String id, int seq) throws Exception{
		String sql = "select * from payment where member_id = ? and seq = ?";
		
		try(Connection conn = this.getConnection();
				PreparedStatement pstat = new LoggableStatement(conn, sql);){
			pstat.setString(1, id);
			pstat.setInt(2, seq);
			try(ResultSet rs = pstat.executeQuery();){
				PaymentDTO dto =new PaymentDTO();;
				if(rs.next()) {
					dto.setReceipt_id(rs.getString("receipt_Id"));
					dto.setPoint(rs.getInt("point"));	
				}
				return dto;
			}
		}
	}
	
	public int deleteByPoint(String id, int seq) throws Exception{
		String sql = "delete from payment where member_id = ? and seq = ?";
		
		try(Connection conn = this.getConnection();
				PreparedStatement pstat = new LoggableStatement(conn, sql);){
			pstat.setString(1, id);
			pstat.setInt(2, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
}
