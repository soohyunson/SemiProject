package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import DTO.ChallengeDTO;

public class ChallengeDAO {
	private static ChallengeDAO instance;
	private static BasicDataSource bds = new BasicDataSource();
	
	private ChallengeDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@o.qowmq.dev:1521:xe");
		bds.setUsername("semi");
		bds.setPassword("semi");
		bds.setInitialSize(30);
	}
	
	public synchronized static ChallengeDAO getInstance() {
		if(instance==null) {
			instance = new ChallengeDAO();
		}return instance;
	}
	
	public Connection getConnection() throws Exception {
		return bds.getConnection();
	
	}
	
	public int insert(ChallengeDTO dto) throws SQLException, Exception {
		String sql ="insert into challenge values(challenge_seq.nextval,?,?,?,?,?,?,?);";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getStart_date());
			pstat.setString(4, dto.getEnd_date());
			pstat.setString(5, dto.getEnd());
			pstat.setInt(5, dto.getTotal_participate());
			pstat.setString(7, dto.getFile_path());
			
			int result = pstat.executeUpdate();
			conn.commit();
			
			return result;
			
		}
	}
	
	public int delete(int seq) throws SQLException, Exception {
		String sql = "delete * from challenge where seq=?";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
			pstat.setInt(1, seq);
			
			int result = pstat.executeUpdate();
			conn.commit();
			
			return result;
			
		}
	}
	
	public ArrayList<ChallengeDTO> selectAll () throws SQLException, Exception{
		String sql ="select * from challenge";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			
			ArrayList<ChallengeDTO> list = new ArrayList<>();
			while(rs.next()) {
				ChallengeDTO dto = new ChallengeDTO();
				dto.setSeq(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setStart_date(rs.getString(4));
				dto.setEnd_date(rs.getString(5));
				dto.setEnd(rs.getString(6));
				dto.setTotal_participate(rs.getInt(7));
				dto.setFile_path(rs.getString(8));
				
				list.add(dto);
			}
			return list;
			
		}
	}
	
	public ChallengeDTO getChallenge(int seq) throws Exception {
		String sql ="select * from challenge where seq=?";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql)){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				
				ChallengeDTO dto = new ChallengeDTO();
				if(rs.next()) {
					dto.setSeq(rs.getInt(1));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setStart_date(rs.getString(4));
					dto.setEnd_date(rs.getString(5));
					dto.setEnd(rs.getString(6));
					dto.setTotal_participate(rs.getInt(7));
				}
				
				return dto;
				
			}
			
		}
	}

}
