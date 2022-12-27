package kr.co.tj.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.tj.model.vo.ReplyVO;

public class ReplyDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	public boolean writeReply(ReplyVO rvo, int b_no){
		String SQL = "insert into reply(r_content, r_writer, b_no) values(?, ?, ?)";
		boolean rs = false;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setString(1, rvo.getR_content());
	       pstmt.setString(2, rvo.getR_writer());
	       pstmt.setInt(3, b_no);
	       rs = pstmt.execute();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rs;   //데이터베이스 오류
	}
	
	public boolean updateReply(String r_content, int r_no){
		String SQL = "update reply set r_content = ? where r_no = ?";
		boolean rs = false;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setString(1, r_content);
	       pstmt.setInt(2, r_no);
	       rs = pstmt.execute();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rs;   //데이터베이스 오류
	}
	
	public boolean deleteReply(int r_no){
		String SQL = "delete from reply where = ?";
		boolean rs = false;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setInt(1, r_no);
	       rs = pstmt.execute();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rs;   //데이터베이스 오류
	}
	
	public ArrayList<ReplyVO> viewReply(int b_no){
		String SQL = "select * from reply where b_no = ?";
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		ResultSet rs = null;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setInt(1, b_no);
	       rs = pstmt.executeQuery();
	       while(rs.next()) {
	    	   ReplyVO rvo = new ReplyVO();
	    	   rvo.setR_writer(rs.getString("r_writer"));
	    	   rvo.setR_content(rs.getString("r_content"));
	    	   rvo.setR_date(rs.getString("r_date"));
	    	   rvoList.add(rvo);
	       }
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rvoList;   //데이터베이스 오류
	}
}
