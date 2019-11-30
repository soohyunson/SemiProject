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
import configuration.Configuration;

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
		String sql = "insert into member values (member_seq.nextval, ?,?,?,?,?,0,'N')";
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

	public MemberDTO select(String id) throws Exception{ //아이디로 멤버검색
		String sql = "select * from member where id=?";
		try(Connection con = getConnection();
				PreparedStatement psta = con.prepareStatement(sql);){
			MemberDTO mypage = null;

			psta.setString(1, id);

			try(ResultSet rs = psta.executeQuery();){
				if(rs.next()) {
					int seq = rs.getInt(1);
					String id2 = rs.getString(2);
					String pw = rs.getString(3);
					String name = rs.getString(4);
					String phone = rs.getString(5);
					String email = rs.getString(6);
					int point = rs.getInt(7);
					String getout = rs.getString(8);

					mypage = new MemberDTO(seq, id2, pw, name, phone, email, point, getout);
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

	public List<MemberDTO> search(String id) throws Exception{
		//아이디로 검색
		String sql = "select * from member where id = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				List<MemberDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String id2 = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					int point = rs.getInt("point");
					String getout = rs.getNString("getout");

					MemberDTO dto = new MemberDTO(seq, id2, pw, name, phone, email, point, getout);
					list.add(dto);
				}return list;
			}
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
				int seq = rs.getInt("seq");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				int point = rs.getInt("point");
				String getout = rs.getNString("getout");

				MemberDTO dto = new MemberDTO(seq, id, pw, name, phone, email, point, getout);
				list.add(dto);

			}return list;
		}
	}
	
	public boolean isAdmin(String id, String pw) throws Exception{
		String sql = "select * from member where id=? and pw=? and getout='gm'";
		try(Connection con = getConnection();
				PreparedStatement psta = con.prepareStatement(sql);){
			psta.setString(1, id);
			psta.setString(2, pw);
			
			try(ResultSet rs = psta.executeQuery();){
				return rs.next(); //로그인 한 사람이 관리자인지 체크
			}
		}
		
			}
		
	public List<MemberDTO> selectByPage(int start, int end) throws Exception{
		//게시판 숫자 네비
		String sql = "select * from(select member.*, row_number() over (order by seq desc)rown from member)"
				+ "where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<MemberDTO> list = new ArrayList<>();
				while(rs.next()){
					int seq = rs.getInt("seq");
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					int point = rs.getInt("point");
					String getout = rs.getNString("getout");

					MemberDTO dto = new MemberDTO(seq, id, pw, name, phone, email, point, getout);
					list.add(dto);

				}return list;
			}
		}
	}

	public int getArticleCount() throws Exception{ //게시판 내의 총 글 수
		String sql = "select count(*) from member";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			int result =  rs.getInt(1);
			return result;
		}
	}


	public String getPageNavi(int currentPage) throws Exception { //게시판에서 페이지 넘기기 (int 값은 모두 예시)
		// 필요정보 : 게시판 내의 총 글의 갯수, 한 페이지에 몇개의 글을 보여줄것인지, 한 화면에 페이지값을 몇개 보여줄것인지
		int recordTotalCount = this.getArticleCount(); //게시판 내의 총 글의 갯수(db에 몇개의 글이 있는지)
		//int recordCountPerPage = 10; // 한 페이지에 보여줄 글의 갯수
		//int naviCountPerPage = 10; //한 페이지에서 몇개의 네비게이터를 보여줄 것인 지 설정 / 현재 내가 4에 있으면 네비게이터에서는 1부터 10까지 볼 수 있음
		int pageTotalCount = 0;//총 몇개의 페이지인지
		
		
		if(recordTotalCount % Configuration.recordCountPerPage > 0) { // recordTotalCount를 recordCountPerPage로 나누었을때 나머지가 0보다 크다면(즉, 나머지가 생긴다면)
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage +1;
			
		}else {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage;

		}

		//		int currentPage = 3; //내가 지금 있는 페이지의 위치
		//현재 페이지 위치에서 볼 수 있는 네이게이터의 첫번째 값과 마지막 값 구하기

		if(currentPage < 1) { //페이지값을 1 이하 숫자로 하는 경우
			currentPage = 1;
		}else if(currentPage > pageTotalCount){ // 마지막 페이지값보다 높은 페이지값을 요청하는 경우
			currentPage = pageTotalCount;
		}

		int startNavi = ((currentPage-1) / Configuration.naviCountPerPage) * configuration.Configuration.naviCountPerPage + 1; //현재 페이지 위치에서 볼 수 있는 네비게이터의 시작 값
		int endNavi = startNavi + Configuration.naviCountPerPage - 1; //현재 페이지 위치에서 볼 수 있는 네비게이터의 마지막 값.
		if(endNavi > pageTotalCount) { //페이지 끝 값이 비정상적일때/ 총 15페이지가 있을때 15페이지를 선택하면 보여지는 네비는 11-20이 아니라 11-15여야함
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true; // < 표시가 필요한지
		boolean needNext = true; // > 표시가 필요한지

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder(); // += 연산자 대신 사용(가독성을 위해)

		if(needPrev) {
			sb.append("<a href='memberlist.mem?cpage="+(startNavi - 1)+"'> < </a>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='memberlist.mem?cpage="+i+"'>"); //cpage = currentpage
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext) {
			sb.append("<a href='memberlist.mem?cpage="+(endNavi + 1) +"' > > </a>");
		}

		
		return sb.toString();
	}
}
