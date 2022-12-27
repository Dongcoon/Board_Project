package kr.co.tj.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.tj.common.JDBCUtil;
import kr.co.tj.model.vo.BoardVO;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	public ArrayList<BoardVO> selectAll(BoardVO bvo, int pageNum,int rowsPerPage){
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		ResultSet rs = null;		
		conn = JDBCUtil.connect();
		String selectAll = "select b_no,b_title,b_content,b_writer,b_readcount,category,sub_category,b_date,u_id from board where category like concat(?,'%') and sub_category like concat(?,'%') order by b_no desc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(selectAll);	
			pstmt.setString(1, bvo.getCategory());
			pstmt.setString(2, bvo.getSub_category());			
			pstmt.setInt(3, (pageNum-1)*rowsPerPage);
			pstmt.setInt(4, rowsPerPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				
				vo.setB_no(rs.getInt("b_no"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_content(rs.getString("b_content"));
				vo.setB_writer(rs.getString("b_writer"));
				vo.setB_readcount(rs.getInt("b_readcount"));
				vo.setCategory(rs.getString("category"));
				vo.setSub_category(rs.getString("sub_category"));
				vo.setB_date(rs.getString("b_date"));
				vo.setU_id(rs.getString("u_id"));
				
				boardList.add(vo);
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
		
		return boardList;
	}
	
	public BoardVO selectOne(BoardVO vo) {
		ResultSet rs = null;
		conn = JDBCUtil.connect();
		String selectOne = "select b_no,b_title,b_content,b_writer,b_readcount,category,sub_category,b_date,u_id from board where b_no=?";
		
		try {
			pstmt = conn.prepareStatement(selectOne);
			pstmt.setInt(1, vo.getB_no());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setB_no(rs.getInt("b_no"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_content(rs.getString("b_content"));
				vo.setB_writer(rs.getString("b_writer"));
				vo.setB_readcount(rs.getInt("b_readcount"));
				vo.setCategory(rs.getString("category"));
				vo.setSub_category(rs.getString("sub_category"));
				vo.setB_date(rs.getString("b_date"));
				vo.setU_id(rs.getString("u_id"));
			} else {
				System.out.println("BoardDAO로그 : selectOne 데이터 없음");
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
	
	public boolean insert(BoardVO vo) {
		boolean result = false;
		conn = JDBCUtil.connect();
		String insert = "insert board(b_title,b_content,b_writer,category,sub_category,u_id) values(?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(insert);
			pstmt.setString(1, vo.getB_title());
			pstmt.setString(2, vo.getB_content());
			pstmt.setString(3, vo.getB_writer());
			pstmt.setString(4, vo.getCategory());
			pstmt.setString(5, vo.getSub_category());
			pstmt.setString(6, vo.getU_id());
			if (pstmt.executeUpdate() != 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return result;
	}
	
	public boolean delete(BoardVO vo) {
		boolean result = false;
		conn = JDBCUtil.connect();
		String delete = "delete from board where b_no=?";
		
		try {
			pstmt = conn.prepareStatement(delete);
			//delete = "delete from board where b_no=?";
			pstmt.setInt(1, vo.getB_no());
			if (pstmt.executeUpdate() != 0) {
				result = true;
			} else {
				System.out.println("BoardDAO로그 : delete 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return result;
	}
	
	public boolean update(BoardVO vo) {
		boolean result = false;
		conn = JDBCUtil.connect();
		String update = "update board set b_title=?,b_content=?,category=?,sub_category=?,b_readcount=? where b_no=?";
		
		try {
			pstmt = conn.prepareStatement(update);
			//System.out.println("수정내용:"+vo);
			pstmt.setString(1, vo.getB_title());
			pstmt.setString(2, vo.getB_content());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getSub_category());	
			pstmt.setInt(5, vo.getB_readcount());
			pstmt.setInt(6, vo.getB_no());
			
			if (pstmt.executeUpdate() != 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		return result;
	}
		
	public int countData(BoardVO vo) {
		int count = 0;
		ResultSet rs = null;
		conn = JDBCUtil.connect();
		String countData = "select count(*) from board where category like concat(?,'%') and sub_category like concat(?,'%')";
		
		try {
			pstmt = conn.prepareStatement(countData);
			//countData = "select count(*) from board where category like concat(?,'%') and sub_category like concat(?,'%')";
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getSub_category());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
			//System.out.println("count="+count+", "+pstmt.toString());
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
		
		return count;
	}
	
	public ArrayList<BoardVO> search(BoardVO bvo,int pageNum,int rowsPerPage){
        ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
        ResultSet rs = null;        
        conn = JDBCUtil.connect();
        String search = "select b_no,b_title,b_content,b_writer,b_readcount,category,sub_category,b_date,u_id from board where b_title like concat('%',?,'%') order by b_no desc limit ?,?";
        
        try {
            pstmt = conn.prepareStatement(search);    
            pstmt.setString(1, bvo.getB_title());
            pstmt.setInt(2, (pageNum-1)*rowsPerPage);
            pstmt.setInt(3, rowsPerPage);
            //System.out.println(pstmt.toString());
            
            rs = pstmt.executeQuery();
            while(rs.next()) {
                BoardVO vo = new BoardVO();
                
                vo.setB_no(rs.getInt("b_no"));
                vo.setB_title(rs.getString("b_title"));
                vo.setB_content(rs.getString("b_content"));
                vo.setB_writer(rs.getString("b_writer"));
                vo.setB_readcount(rs.getInt("b_readcount"));
                vo.setCategory(rs.getString("category"));
                vo.setSub_category(rs.getString("sub_category"));
                vo.setB_date(rs.getString("b_date"));
                vo.setU_id(rs.getString("u_id"));
                
                boardList.add(vo);
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
        
        return boardList;
    }
	
	public int countSearch(BoardVO vo) {
        int count = 0;
        ResultSet rs = null;
        conn = JDBCUtil.connect();
        String countSearch = "select count(*) from board where b_title like concat('%',?,'%')";	
        
        try {
            pstmt = conn.prepareStatement(countSearch);
            pstmt.setString(1, vo.getB_title());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count(*)");
            }
            //System.out.println("count="+count+", "+pstmt.toString());
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
        
        return count;
    }
}
