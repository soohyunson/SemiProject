package DAO;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public static String encrypt(String input) throws Exception {//비밀번호 암호화
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		digest.reset();
		digest.update(input.getBytes("utf8"));
		String result = String.format("%064x", new BigInteger(1, digest.digest()));
		return result;
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
		String sql = "insert into member values (?,?,?,?,?,0,'N')";
		try(Connection con = getConnection();
				PreparedStatement psta = con.prepareStatement(sql);){
			psta.setString(1, dto.getId());
			psta.setString(2, encrypt(dto.getPw()));
			psta.setString(3, dto.getName());
			psta.setString(4, dto.getPhone());
			psta.setString(5, dto.getEmail());

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

	public boolean isIdOk(String id) throws Exception{
		String sql = "select * from member where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);

			ResultSet rs = pstat.executeQuery();
			boolean result = rs.next();
			con.commit();
			return result;
		}
	}

	public int update(MemberDTO dto, String id) throws Exception{
		String sql = "update member set pw=?, phone=?, email=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, encrypt(dto.getPw()));
			pstat.setString(2, dto.getPhone());
			pstat.setString(3, dto.getEmail());
			int result = pstat.executeUpdate();
			return result;
			//개인정보 수정
		}
	}

	public List<MemberDTO> selectAll() throws Exception{
		String sql = "select * from member";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<MemberDTO> list = new ArrayList<>();
			while(rs.next()){
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				int point = rs.getInt("point");
				String getout = rs.getNString("getout");
				
				MemberDTO dto = new MemberDTO(id, pw, name, phone, email, point, getout);
				list.add(dto);
				
			}return list;
		}

	}
}
