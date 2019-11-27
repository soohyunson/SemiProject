package DTO;

public class File_ListDTO {
	
	private int seq;
	private String file_name;
	private String original_name;
	private String upload_date;
	private int challenge_record_num;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getOriginal_name() {
		return original_name;
	}
	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	public int getChallenge_record_num() {
		return challenge_record_num;
	}
	public void setChallenge_record_num(int challenge_record_num) {
		this.challenge_record_num = challenge_record_num;
	}
	public File_ListDTO(int seq, String file_name, String original_name, String upload_date, int challenge_record_num) {
		super();
		this.seq = seq;
		this.file_name = file_name;
		this.original_name = original_name;
		this.upload_date = upload_date;
		this.challenge_record_num = challenge_record_num;
	}
	public File_ListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
