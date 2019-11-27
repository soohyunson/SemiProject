package DTO;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private int point;
	private String getout;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getGetout() {
		return getout;
	}
	public void setGetout(String getout) {
		this.getout = getout;
	}
	public MemberDTO(String id, String pw, String name, String phone, String email, int point, String getout) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.point = point;
		this.getout = getout;
	}
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
}
