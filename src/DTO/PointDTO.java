package DTO;

public class PointDTO {
	
	private int seq;
	private int point;
	private String date;
	private String member_id;
	private int challenge_num;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getChallenge_num() {
		return challenge_num;
	}
	public void setChallenge_num(int challenge_num) {
		this.challenge_num = challenge_num;
	}
	public PointDTO(int seq, int point, String date, String member_id, int challenge_num) {
		super();
		this.seq = seq;
		this.point = point;
		this.date = date;
		this.member_id = member_id;
		this.challenge_num = challenge_num;
	}
	public PointDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
