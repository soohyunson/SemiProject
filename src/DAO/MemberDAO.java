package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import DTO.MemberDTO;

public class MemberDAO {
	
	private static MemberDAO instance;
	private static BasicDataSource bds = new BasicDataSource();
	
	private MemberDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@o.qowmq.dev:1521:xe");
		bds.setUsername("semi");
		bds.setPassword("semi");
		bds.setInitialSize(30);
	}
	
	public synchronized static MemberDAO getInstance() {
		if(instance==null) {
			instance = new MemberDAO();
		}return instance;
	}
	
	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}
	
	public boolean isLoginOK(String id, String pw)throws Exception{
		String sql = "select * from Member where id = ? and pw = ?";
		try(Connection con = getConnection();
				PreparedStatement psta = con.prepareStatement(sql);){
			psta.setString(1, id);
			psta.setString(2, pw);
			try(ResultSet rs = psta.executeQuery();){
				return rs.next();
			}
	
		}
		
	}
	
	public int insert(MemberDTO dto) throws Exception{
		String sql = "insert into member values (?,?,?,?,?,?,?)";
		try(Connection con = getConnection();
				PreparedStatement psta = con.prepareStatement(sql);){
			psta.setString(1, dto.getId());
			psta.setString(2, dto.getPw());
			psta.setString(3, dto.getName());
			psta.setString(4, dto.getPhone());
			psta.setString(5, dto.getEmail());
			psta.setInt(6, dto.getPoint());
			psta.setString(7, dto.getGetout());
			
			int result = psta.executeUpdate();
			con.commit();
			return result;
			
		}
		
	}
	
	public int delete(String id) throws Exception{
		String sql = "delete from member where id = ?";
		try(Connection con = getConnection();
				PreparedStatement psta = con.prepareStatement(sql);){
			psta.setString(1, id);
			
			int result = psta.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public MemberDTO select(String id) throws Exception{
		String sql = "select * from member where id=?";
				try(Connection con = getConnection();
						PreparedStatement psta = con.prepareStatement(sql);){
					MemberDTO mypage = null;
					
					psta.setString(1, id);
					
					try(ResultSet rs = psta.executeQuery();){
						if(rs.next()) {
							String id2 = rs.getString(1);
							String pw = rs.getString(2);
							String name = rs.getString(3);
							String phone = rs.getString(4);
							String email = rs.getString(5);
							int point = rs.getInt(6);
							String getout = rs.getString(7);
							
							mypage = new MemberDTO(id2, pw, name, phone, email, point, getout);
							con.commit();
						}
					}
					return mypage;
					
				}
	}
	
//	public int update(String id) throws Exception{
//		String sql = "";
//	}
//	
	
	
	
	
}
