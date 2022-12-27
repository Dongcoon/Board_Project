package kr.co.tj.model.vo;

public class LetterVO {
	private int l_no;
	private String l_title;
	private String l_content;
	private String l_sender;
	private String l_receiver;
	private String l_date;	
	
	public LetterVO() {
		super();
	}
	
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public String getL_title() {
		return l_title;
	}
	public void setL_title(String l_title) {
		this.l_title = l_title;
	}
	public String getL_content() {
		return l_content;
	}
	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	public String getL_sender() {
		return l_sender;
	}
	public void setL_sender(String l_sender) {
		this.l_sender = l_sender;
	}
	public String getL_receiver() {
		return l_receiver;
	}
	public void setL_receiver(String l_receiver) {
		this.l_receiver = l_receiver;
	}
	public String getL_date() {
		return l_date;
	}
	public void setL_date(String l_date) {
		this.l_date = l_date;
	}
	@Override
	public String toString() {
		return "LetterVO [l_no=" + l_no + ", l_title=" + l_title + ", l_content=" + l_content + ", l_sender=" + l_sender
				+ ", l_receiver=" + l_receiver + ", l_date=" + l_date + "]";
	}	
	
}
