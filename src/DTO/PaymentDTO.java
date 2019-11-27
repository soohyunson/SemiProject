package DTO;

public class PaymentDTO {
	
	private int seq;
	private int point;
	private int end_date ;
	private String approval_num;
	private String company;
	private String member_id;
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
	public int getEnd_date() {
		return end_date;
	}
	public void setEnd_date(int end_date) {
		this.end_date = end_date;
	}
	public String getApproval_num() {
		return approval_num;
	}
	public void setApproval_num(String approval_num) {
		this.approval_num = approval_num;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public PaymentDTO(int seq, int point, int end_date, String approval_num, String company, String member_id) {
		super();
		this.seq = seq;
		this.point = point;
		this.end_date = end_date;
		this.approval_num = approval_num;
		this.company = company;
		this.member_id = member_id;
	}
	public PaymentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
