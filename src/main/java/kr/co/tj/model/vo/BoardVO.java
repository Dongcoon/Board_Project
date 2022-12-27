package kr.co.tj.model.vo;

public class BoardVO {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private int b_readcount;
	private String category;
	private String sub_category;
	private String b_date;
	private String u_id;
	
	public BoardVO() {
		super();
	}
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}	
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	@Override
	public String toString() {
		return "BoardVO [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_writer=" + b_writer
				+ ", b_readcount=" + b_readcount + ", category=" + category + ", sub_category=" + sub_category
				+ ", b_date=" + b_date + ", u_id=" + u_id + "]";
	}
	
}
