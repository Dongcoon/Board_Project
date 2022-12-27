package kr.co.tj.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.tj.common.JDBCUtil;
import kr.co.tj.model.vo.MemberVO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	public boolean insert(MemberVO vo) {
		String SQL = "insert into userinfo (u_id,u_pw,u_name,u_nickname,u_email,u_jumin) values(?,?,?,?,?,?)";
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,vo.getU_id());
			pstmt.setString(2,vo.getU_pw());
			pstmt.setString(3,vo.getU_name());
			pstmt.setString(4,vo.getU_nickname());
			pstmt.setString(5,vo.getU_email());
			pstmt.setString(6,vo.getU_jumin());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	
	public MemberVO login(MemberVO vo) {
		String SQL = "select u_id,u_pw,u_nickname from userinfo where u_id=?";
		ResultSet rs = null;
		conn = JDBCUtil.connect();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, vo.getU_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setU_pw(rs.getString("u_pw"));
				vo.setU_nickname(rs.getString("u_nickname"));
			} else {
				System.out.println("login 로그 : 존재하지 않는 아이디");
				vo = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return vo;
	}
	public MemberVO mypage(String u_id) {
		String SQL = "select * from userinfo where u_id = ?";
		MemberVO data = null;
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setNString(1, u_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data = new MemberVO();
				
				data.setU_id(rs.getString("u_id"));
				data.setU_pw(rs.getString("u_pw"));
				data.setU_name(rs.getString("u_name"));
				data.setU_nickname(rs.getString("u_nickname"));
				data.setU_jumin(rs.getString("u_jumin"));
				data.setU_email(rs.getString("u_email"));
				data.setU_date(rs.getString("u_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		System.out.println("mypageSQL 실행!");
		return data;
	}
	public boolean delete(String u_id) {
		String SQL = "delete from userinfo where u_id = ?";
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setNString(1, u_id);
			System.out.println(pstmt.toString()+" "+u_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	public boolean update(MemberVO vo) {
		String SQL = "update userinfo set u_pw=?, u_nickname=? where u_id=?";
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setNString(1, vo.getU_pw());
			pstmt.setNString(2, vo.getU_nickname());
			pstmt.setNString(3, vo.getU_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	// id 중복체크
	public int m_checkId(String u_id) {
		conn=JDBCUtil.connect();
		int check = 0;
		String m_idCheck="select mid from userinfo where u_id=?";
		
		try {
			pstmt=conn.prepareStatement(m_idCheck);
			pstmt.setString(1,u_id);			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next() || u_id.equals("")) { // 불가
				check = 0;
			} else { // 가능
				check = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return check;
	}
	public MemberVO searchID(MemberVO mvo) {
        ResultSet rs = null;
        conn = JDBCUtil.connect();
        String SQL = "select u_id from userinfo where u_name=? and u_jumin=?";
        
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, mvo.getU_name());
            pstmt.setString(2, mvo.getU_jumin());
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                mvo.setU_id(rs.getString("u_id"));
            } else {
                mvo = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JDBCUtil.disconnect(pstmt, conn);
        }
        
        return mvo;
	}
}
