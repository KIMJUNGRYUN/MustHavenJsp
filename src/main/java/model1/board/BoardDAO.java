package model1.board;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect{
	
	public BoardDAO(ServletContext application) {
			super(application);
	}
	
	//게시물 갯수 세기(검색한 게시물 숫자, 100개 /10 페이지 계산)
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; //게시물갯수 변수
		
		String query = "SELECT COUNT(*) FROM board";
		if(map.get("searchWord") != null) {
			query += " WEHRE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next(); //select 쿼리 결과의 1번째 행
			totalCount = rs.getInt(1); //1번째 열의 값
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		return totalCount; 
	}
	
	//게시물 목록 가져오기
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board ";
		if(map.get("searchWord") != null) {
			query += " WEHRE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY NUM DESC";
		
		try {
			stmt = con.createStatement();
			 rs = stmt.executeQuery(query);
			 
			 while(rs.next()) {
				 BoardDTO dto = new BoardDTO();
				 
				 dto.setNum(rs.getString("num"));
				 dto.setTitle(rs.getString("title"));
				 dto.setContent(rs.getString("content"));
				 dto.setPostdate(rs.getDate("postdate"));
				 dto.setId(rs.getString("id"));
				 dto.setVisitcount(rs.getString("visitcount"));
				 
				 bbs.add(dto);
			 }
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
}
