package DTO;

import java.sql.Date;

public class PaymentDTO {
	
	private int seq;
	private int point;
	private String payment_date ;
	private String approval_num;
	private String company;
	private String member_id;
	
	
	
	public PaymentDTO(int seq, int point, String payment_date, String approval_num, String company, String member_id) {
		super();
		this.seq = seq;
		this.point = point;
		this.payment_date = payment_date;
		this.approval_num = approval_num;
		this.company = company;
		this.member_id = member_id;
	}
	
	
	public PaymentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


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
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
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

	

}
