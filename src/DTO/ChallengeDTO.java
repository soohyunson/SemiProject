package DTO;

public class ChallengeDTO {
	
	private int seq;
	private String title;
	private String content;
	private String start_date;
	private String end_date;
	private String end;
	private int total_participate;
	private String file_path;
	private String giveortake;
	private String category;
	private int pp_point;
	private int total_amount;

	public ChallengeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChallengeDTO(int seq, String title, String content, String start_date, String end_date, String end,
			int total_participate, String file_path, String giveortake,String category,int pp_point,int total_amount) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.start_date = start_date;
		this.end_date = end_date;
		this.end = end;
		this.total_participate = total_participate;
		this.file_path=file_path;
		this.giveortake=giveortake;
		this.category=category;
		this.pp_point=pp_point;
		this.total_amount=total_amount;
	}
	public ChallengeDTO(String end_date) {
		super();
		this.end_date = end_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date=end_date;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getTotal_participate() {
		return total_participate;
	}
	public void setTotal_participate(int total_participate) {
		this.total_participate = total_participate;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path=file_path;
	}
	public String getGiveortake() {
		return giveortake;
	}
	public void setGiveortake(String giveortake) {
		this.giveortake = giveortake;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPp_point() {
		return pp_point;
	}
	public void setPp_point(int pp_point) {
		this.pp_point = pp_point;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	

}
