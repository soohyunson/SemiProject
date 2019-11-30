package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import DTO.ChallengeDTO;
import DTO.MemberDTO;
import adminboardCongiuration.Configuration;

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
		if (instance == null) {
			instance = new ChallengeDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();

	}

	public int insert(ChallengeDTO dto) throws SQLException, Exception {
		String sql = "insert into challenge values(challenge_seq.nextval,?,?,?,?,?,?,?);";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getStart_date());
			pstat.setString(4, dto.getEnd_date());
			pstat.setString(5, dto.getEnd());
			pstat.setInt(6, dto.getTotal_participate());
			pstat.setString(7, dto.getFile_path());
			pstat.setString(8, dto.getGiveortake());
			pstat.setString(9, dto.getCategory());
			pstat.setInt(10, dto.getPp_point());
			pstat.setInt(11, dto.getTotal_amount());

			int result = pstat.executeUpdate();
			conn.commit();

			return result;

		}
	}
	public int update(ChallengeDTO dto,int seq) throws SQLException, Exception {
		String sql = "update challenge set title=?,content=?,start_date=?,end_date=?,end=?,file_path=?,giveortake=?,category=? where seq=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getStart_date());
			pstat.setString(4, dto.getEnd_date());
			pstat.setString(5, dto.getEnd());
			pstat.setString(6, dto.getFile_path());
			
			pstat.setString(7, dto.getGiveortake());
			pstat.setString(8, dto.getCategory());
			
			pstat.setInt(9, seq);

			int result = pstat.executeUpdate();
			conn.commit();

			return result;

		}
	}

	public int delete(int seq) throws SQLException, Exception {
		String sql = "delete * from challenge where seq=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			conn.commit();

			return result;

		}
	}

	public ArrayList<ChallengeDTO> selectAll () throws SQLException, Exception{
		String sql ="select * from challenge ";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
				try(ResultSet rs = pstat.executeQuery()){
			
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
				dto.setGiveortake(rs.getString(9));
				dto.setCategory(rs.getString(10));
				dto.setPp_point(rs.getInt(11));
				dto.setTotal_amount(rs.getInt(12));
				
				list.add(dto);

			}
			return list;
		}
		}

	}
	
	
	public ArrayList<ChallengeDTO> selectAll (String giveortake) throws Exception{
		String sql ="select * from challenge where giveortake=?";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
				pstat.setString(1, giveortake);
				try(ResultSet rs = pstat.executeQuery()){
			
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
				dto.setGiveortake(rs.getString(9));
				dto.setCategory(rs.getString(10));
				dto.setPp_point(rs.getInt(11));
				dto.setTotal_amount(rs.getInt(12));
				
				list.add(dto);

			}
			return list;
		}
		}

	}
	
	public ArrayList<ChallengeDTO> selectAll (int seq,String giveortake) throws Exception{
		String sql ="select * from challenge where seq=? and giveortake=?";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
				pstat.setInt(1, seq);
				pstat.setString(2, giveortake);
				try(ResultSet rs = pstat.executeQuery()){
			
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
				dto.setGiveortake(rs.getString(9));
				dto.setCategory(rs.getString(10));
				dto.setPp_point(rs.getInt(11));
				dto.setTotal_amount(rs.getInt(12));
				
				list.add(dto);

			}
			return list;
		}
		}

	}
	
	public ArrayList<ChallengeDTO> getCatergoryChallege(String giveortake , String category) throws SQLException, Exception{
		String sql="select * from challenge where giveortake=? and category =?";
		try(Connection conn = getConnection();
				PreparedStatement pstat = conn.prepareStatement(sql);){
			pstat.setString(1, giveortake);
			pstat.setString(2, category);
			
			try(ResultSet rs = pstat.executeQuery()){
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
					dto.setGiveortake(rs.getString(9));
					dto.setCategory(rs.getString(10));
					dto.setPp_point(rs.getInt(11));
					dto.setTotal_amount(rs.getInt(12));
					
					list.add(dto);
				}
				return list;
			}
			
		}
		
	}
	
	

	public ChallengeDTO getChallenge(int seq) throws Exception {
		String sql = "select * from challenge where seq=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			try (ResultSet rs = pstat.executeQuery()) {

				ChallengeDTO dto = new ChallengeDTO();
				if (rs.next()) {
					dto.setSeq(rs.getInt(1));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setStart_date(rs.getString(4));
					dto.setEnd_date(rs.getString(5));
					dto.setEnd(rs.getString(6));
					dto.setTotal_participate(rs.getInt(7));
					dto.setFile_path(rs.getString(8));
					dto.setGiveortake(rs.getString(9));
					dto.setCategory(rs.getString(10));
					dto.setPp_point(rs.getInt(11));
					dto.setTotal_amount(rs.getInt(12));
				}

				return dto;

			}

		}
	}

	public ChallengeDTO getChallenge(String giveortake) throws Exception {
		String sql = "select * from challenge where giveortake=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql)) {
			
			pstat.setString(1, giveortake);
			try (ResultSet rs = pstat.executeQuery()) {

				ChallengeDTO dto = new ChallengeDTO();
				if (rs.next()) {
					dto.setSeq(rs.getInt(1));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setStart_date(rs.getString(4));
					dto.setEnd_date(rs.getString(5));
					dto.setEnd(rs.getString(6));
					dto.setTotal_participate(rs.getInt(7));
					dto.setFile_path(rs.getString(8));
					dto.setGiveortake(rs.getString(9));
					dto.setCategory(rs.getString(10));
					dto.setPp_point(rs.getInt(11));
					dto.setTotal_amount(rs.getInt(12));
				}

				return dto;

			}

		}
	}
	
	public List<ChallengeDTO> selectByPage(int p_start,int p_end) throws Exception{
		 String sql = "select * from "
		 		+ "(select challenge.*, row_number()over (order by seq desc)"
		 		+ " as rown from challenge) where rown between ? and ?"; 
		 try(
				 Connection con = this.getConnection();
				 PreparedStatement pstat = con.prepareStatement(sql);
					){
			 
			 pstat.setInt(1, p_start);
			 pstat.setInt(2, p_end);
						 try(
					 ResultSet rs = pstat.executeQuery();
								 ){
					 List<ChallengeDTO> result = new ArrayList<>();
					 while(rs.next()){
						 int seq = rs.getInt(1);
						 String title = rs.getString(2);
						 String content = rs.getString(3);
						 String start_date = rs.getString(4);
						 String end_date = rs.getString(5);
						 String end = rs.getString(6);
						 int total_partcipate = rs.getInt(7);
						 String file_path = rs.getString(8);
						 String giveortake = rs.getString(9);
						 String category = rs.getString(10);
						 int pp_point = rs.getInt(11);
						 int total_amount = rs.getInt(12);
						 ChallengeDTO dto = new ChallengeDTO(seq,title,content,start_date,end_date,end,total_partcipate,file_path,giveortake,category,pp_point,total_amount);
						 
						 result.add(dto);
					 }
					 con.commit();
					 return result;
						 }//try2
			         }//try1
	 }
	public int insertWrite(ChallengeDTO dto) throws Exception{
		 String sql = "insert into challenge values(challenge_seq.nextval,?,?,TO_DATE(?, 'YYYY-MM-DD'),TO_DATE(?, 'YYYY-MM-DD'),'N','0',?,?,?,?,?)";
		 
		 try(
		 Connection con = this.getConnection();
		 PreparedStatement pstat = con.prepareStatement(sql);
				 ){
		 pstat.setString(1, dto.getTitle());
		 pstat.setString(2, dto.getContent());
		 pstat.setString(3, dto.getStart_date());
		 pstat.setString(4, dto.getEnd_date());
		 pstat.setString(5, dto.getFile_path());
		 pstat.setString(6, dto.getGiveortake());
		 pstat.setString(7, dto.getCategory());
		 pstat.setInt(8, dto.getPp_point());
		 pstat.setInt(9, dto.getTotal_amount());
		 int result = pstat.executeUpdate();
		 con.commit();
		 return result;
		 }
	 }
	private int getArticleCount() throws Exception{
		 String sql = "select count(*) from challenge";
		 try(
		 Connection con = this.getConnection();
		 PreparedStatement pstat = con.prepareStatement(sql);
		 ResultSet rs = pstat.executeQuery();
		 ){
			 rs.next();
			 return rs.getInt(1);
		 }//try
	 }
	 
	 public String getPageNavi(int currentPage) throws Exception {
		 //게시판 내의 총 글의 개수
		 int recordTotalCount = this.getArticleCount();
		 
		 //페이지 당 몇개의 게시글
//		 int recordCountPerPage = 10;
		 
		 // 한 페이지에서 몇개의 네비게이터를 보여줄 지 설정
//		 int naviCountPerPage = 10;
		 
		 // 총 몇 개의 페이지 인가
		 int pageTotalCount = 0;
		 if(recordTotalCount % Configuration.recordCountPerPage >0) {
			 // 총 글의 개수를 페이지당 보여줄 개수로 나누었을 때, 나머지가 생기면
			 // 총 페이지의 개수 + 1
			 //ex) 143 /10 = 14 이고 나머지 3이니 페이지는 총 15개가 되어야 하니 +1
		 pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		 }else {
			 pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		 }
		 //현재 내가 위치하는 페이지
		 
	     //현재 페이지값이 범위를 넘어섰을 때	 
		 if(currentPage < 1) {
			 currentPage = 1;
		 }else if(currentPage > pageTotalCount) {
			 currentPage = pageTotalCount;
		 }
		 //현재 내가 위치하고 있는 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		 int startNavi = (currentPage-1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		 int endNavi = startNavi + Configuration.naviCountPerPage - 1;
		 //페이지 끝 값이 비정상 값일 때, 조정하는 보안 코드
		 if(endNavi > pageTotalCount) {
			 endNavi = pageTotalCount;
		 }
		 System.out.println("현재 페이지 번호 : " + currentPage);
		 System.out.println("네비게이터 시작 번호: " + startNavi);
		 System.out.println("네비게이터 끝 번호 : " + endNavi);
		 
		 boolean needPrev = true;
		 boolean needNext = true;
		 
		 if(startNavi == 1) {
			 needPrev = false;
		 }
		 if(endNavi == pageTotalCount) {
			 needNext = false;
		 }
		 
		 StringBuilder sb = new StringBuilder();
		 if(needPrev) {sb.append("<a href='list.adboard?currentPage="+(startNavi -1)+"'> < </a>");}
		 
		 for(int i= startNavi; i<= endNavi;i++) {
			 sb.append("<a href='list.adboard?currentPage="+i+"'>");
			 sb.append(i + " ");
			 sb.append("</a>");
		 }
		 if(needNext) {sb.append("<a href='list.adboard?currentPage="+(endNavi +1)+"'> > </a>");}
		 
		 

		return sb.toString();

	}
}
