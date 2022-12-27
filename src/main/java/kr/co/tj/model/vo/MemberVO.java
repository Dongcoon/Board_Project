package kr.co.tj.model.vo;

public class MemberVO {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_nickname;
	private String u_email;
	private String u_jumin;
	private String u_date;
	
	public MemberVO() {
		super();
	}
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_jumin() {
		return u_jumin;
	}
	public void setU_jumin(String u_jumin) {
		this.u_jumin = u_jumin;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	
	@Override
	public String toString() {
		return "MemberVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_nickname=" + u_nickname
				+ ", u_email=" + u_email + ", u_jumin=" + u_jumin + ", u_date=" + u_date + "]";
	}
	
}
