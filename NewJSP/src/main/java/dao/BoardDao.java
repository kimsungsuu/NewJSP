package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import dbCon.SqlDbConnection;
import dto.BoardDto;

public class BoardDao {
	
	private SqlDbConnection dbCon = new SqlDbConnection();;
	
	//게시글 리스트 출력
	public ArrayList<BoardDto> boardList(){
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		ArrayList<BoardDto> list = new ArrayList<>();
		
		
		
		try {
			//mysql db connection
		    con = dbCon.getConnection();
			
		    //어떻게 하면 10개의 게시글을 내림차순으로 가져올 수 있을까.
			String sql = "select * from board_tb limit 10";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto bean = new BoardDto();
				
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setCategory(rs.getString("category"));
				bean.setCreate_date(rs.getDate("create_date"));
				bean.setMod_date(rs.getDate("mod_date"));
				bean.setHit(rs.getInt("hit"));
				
				list.add(bean);
			}
			
			//con, pstmt, rs close
			dbCon.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print("boardList DB 에러");	
		}
		
		return list;
	}
	
	// 작성한 글 저장
	public void boardPost(String title, String category, String writer, String password, String text) {
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
	
		
		try {
			con = dbCon.getConnection();
			String sql = "insert into board_tb(title, category, wirter, password, text, create_date, mod_date, hit) value(?,?,?,?,?,now(),now(),1)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(0, title);
			pstmt.setString(1, category);
			pstmt.setString(2, writer);
			pstmt.setString(3, password);
			pstmt.setString(4, text);
		
			
			pstmt.executeUpdate();
			
			System.out.println("boardPost 작업 성공!");
			
			dbCon.close();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("boardPost 메서드 SQL 에러입니다.");
		}
		
	}
	
	
}
