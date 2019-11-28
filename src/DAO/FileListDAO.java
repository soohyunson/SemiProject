package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import DTO.File_ListDTO;

public class FileListDAO {
	private static FileListDAO instance;
	private static BasicDataSource bds = new BasicDataSource();

	private FileListDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@o.qowmq.dev:1521:xe");
		bds.setUsername("semi");
		bds.setPassword("semi");
		bds.setInitialSize(30);
	}

	public synchronized static FileListDAO getInstance() {
		if (instance == null) {
			instance = new FileListDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}
	
	public int insert(File_ListDTO dto) throws SQLException, Exception {
		String sql ="insert into file_list values(file_list_seq.nextval,?,?,?,sysdate,?)";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
			pstat.setString(1, dto.getFile_name());
			pstat.setString(2, dto.getFile_path());
			pstat.setString(3, dto.getOriginal_name());
			pstat.setInt(4, dto.getChallenge_record_num());
			
			int result = pstat.executeUpdate();
			
			conn.commit();
			
			return result;
			
		}
	}


}
