package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String sql = "insert into file_list values(file_list_seq.nextval,?,?,?,?,?)";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, dto.getFile_name());
			pstat.setString(2, dto.getFile_path());
			pstat.setString(3, dto.getOriginal_name());
			pstat.setString(4, dto.getUpload_date());
			pstat.setInt(5, dto.getChallenge_record_num());

			int result = pstat.executeUpdate();

			conn.commit();

			return result;

		}
	}

	public List<File_ListDTO> selectAll(int num) throws SQLException, Exception {
		String sql = "select * from file_list where challenge_record_num=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setInt(1, num);
			try (ResultSet rs = pstat.executeQuery()) {
				List<File_ListDTO> list = new ArrayList<File_ListDTO>();
				while (rs.next()) {
					File_ListDTO dto = new File_ListDTO();
					dto.setSeq(rs.getInt(1));
					dto.setFile_name(rs.getString(2));
					dto.setFile_path(rs.getString(3));
					dto.setOriginal_name(rs.getString(4));
					dto.setUpload_date(rs.getString(5));
					dto.setChallenge_record_num(rs.getInt(6));

					list.add(dto);
				}

				return list;

			}

		}

	}

	public int getSeq() throws SQLException, Exception {
		String sql = "select * from file_list order by 1 desc";
		try (Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {
			int seq = 0;
			if (rs.next()) {
				seq = rs.getInt(1);
			}
			return seq;

		}
	}

	public int update(int seq, File_ListDTO dto) throws SQLException, Exception {
		String sql = "update file_list set file_name=?,file_path=?,original_name=?,upload_date=?,challenge_record_num=? where seq=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, dto.getFile_name());
			pstat.setString(2, dto.getFile_path());
			pstat.setString(3, dto.getOriginal_name());
			pstat.setString(4, dto.getUpload_date());
			pstat.setInt(5, dto.getChallenge_record_num());
			pstat.setInt(6, seq);

			int result = pstat.executeUpdate();

			conn.commit();

			return result;

		}

	}

}
