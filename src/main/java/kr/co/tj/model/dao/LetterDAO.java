package kr.co.tj.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.tj.common.JDBCUtil;
import kr.co.tj.model.vo.LetterVO;

public class LetterDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 쪽지함 리스트를 가져오는 메서드
	public ArrayList<LetterVO> getLetterList(String id, String whether){
		String SQL = null;
		conn = JDBCUtil.connect();
		if(whether.equals("sent") || whether=="") {
			SQL = "select * from sentletter where l_sender = ? order by l_no desc";
		}else if(whether.equals("received")) {
			SQL = "select * from receivedletter where l_receiver = ? order by l_no desc";
		}
	    ArrayList<LetterVO> list = new ArrayList<LetterVO>();
		ResultSet rs;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setString(1, id);
	       rs = pstmt.executeQuery();
	       while(rs.next()) {
	    	   LetterVO lvo = new LetterVO();
	           lvo.setL_no(rs.getInt("l_no"));
	           lvo.setL_title(rs.getString("l_title"));
	           lvo.setL_content(rs.getString("l_content"));
	           lvo.setL_sender(rs.getString("l_sender"));
	           lvo.setL_receiver(rs.getString("l_receiver"));
	           lvo.setL_date(rs.getString("l_date"));
	           list.add(lvo);
	       }
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    	return list;   //데이터베이스 오류
	}

	// 쪽지함테이블에 삽입하는 메서드
	public int insertLetter(LetterVO lvo, String whether){
		System.out.println("inserLetter start");
		conn = JDBCUtil.connect();
		String SQL = "insert into " + whether + "letter(l_title, l_content, l_sender, l_receiver) values(?, ?, ?, (select u_id from userinfo where u_nickname = ?))";
		System.out.println(SQL);
		int rs = 0;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setString(1, lvo.getL_title());
	       pstmt.setString(2, lvo.getL_content());
	       pstmt.setString(3, lvo.getL_sender());
	       pstmt.setString(4, lvo.getL_receiver());
	       System.out.println(pstmt.toString()	);
	       rs = pstmt.executeUpdate();
	       System.out.println(rs);
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    return rs;   //데이터베이스 오류
	}
	
	// 쪽지를 하나 삭제하는 메서드
	public boolean deleteLetter(int l_no, String whether){
		conn = JDBCUtil.connect();
		String SQL = "delete from " + whether + "letter where l_no = ?";
		boolean rs = false;
	    try {
	       PreparedStatement pstmt = conn.prepareStatement(SQL);
	       pstmt.setInt(1, l_no);
	       rs = pstmt.execute();
	       System.out.println(rs);
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rs;   //데이터베이스 오류
	}
	// 쪽지를 여러개 삭제하는 메서드
		public boolean deleteManyLetter(String[] l_noList, String whether){
			conn = JDBCUtil.connect();
			String SQL = "delete from " + whether + "letter where l_no = ?";
			boolean rs = false;
		    try {
		    	for(var i=0 ; i<l_noList.length ; i++) {
			        PreparedStatement pstmt = conn.prepareStatement(SQL);
			        String l_no = l_noList[i];
			        pstmt.setInt(1, Integer.parseInt(l_no));
			        rs = pstmt.execute();
		    	}
		    } catch (SQLException e) {
		    	e.printStackTrace();
		    }
		    return rs;   //데이터베이스 오류
		}
	// 쪽지 하나를 보는 메서드
		public LetterVO viewLetter(int l_no, String whether){
			conn = JDBCUtil.connect();
			String SQL = "select * from " + whether + "letter where l_no = ?";
			ResultSet rs;
    	    LetterVO lvo = new LetterVO();
		    try {
		       PreparedStatement pstmt = conn.prepareStatement(SQL);
		       pstmt.setInt(1, l_no);
		       rs = pstmt.executeQuery();
		       System.out.println(pstmt.toString());
		       if(rs.next()) {
		           lvo.setL_no(rs.getInt("l_no"));
		           lvo.setL_title(rs.getString("l_title"));
		           lvo.setL_content(rs.getString("l_content"));
		           lvo.setL_sender(rs.getString("l_sender"));
		           lvo.setL_receiver(rs.getString("l_receiver"));
		           lvo.setL_date(rs.getString("l_date"));
		       }
		    } catch (SQLException e) {
		    	e.printStackTrace();
		    }
		    return lvo;   //데이터베이스 오류
		}
}
