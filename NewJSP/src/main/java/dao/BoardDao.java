package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

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
			String sql = "select * from board_tb order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto bean = new BoardDto();
			
				bean.setNum(rs.getInt("num"));
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
	public void insertBoard(HttpServletRequest request) {
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
	
		
		try {
			con = dbCon.getConnection();
			String sql = "insert into board_tb(title, category, writer, password, text, create_date, mod_date) value(?,?,?,?,?,now(),now())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, request.getParameter("title"));
			pstmt.setString(2, request.getParameter("category"));
			pstmt.setString(3, request.getParameter("writer"));
			pstmt.setString(4, request.getParameter("password"));
			pstmt.setString(5, request.getParameter("text"));
		
		
			pstmt.executeUpdate();
			
			System.out.println("boardPost 작업 성공!");
			
			dbCon.close();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("boardPost 메서드 SQL 에러입니다.");
		}
		
	}
	
	//게시글 읽기
	public BoardDto readBoard(String num) {
		
		BoardDto bean = new BoardDto();
		
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
	
		try {
			con = dbCon.getConnection();
			String sql = "select category, title, writer, text from board_tb where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean.setCategory(rs.getString("category"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setText(rs.getString("text"));
			}
			
			dbCon.close();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("readBoard 메서드 DB 로직 에러입니다!");
		}
		
		
		return bean;
	}
	
	//게시판 수정
	public void updateBoard(HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String writer = request.getParameter("writer");
		String text = request.getParameter("text");
		String num = request.getParameter("num");
		
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
	
		try {
			con = dbCon.getConnection();
			String sql = "update board_tb set title=?, category=?, writer=?, text=?, mod_date=now() where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, category);
			pstmt.setString(3, writer);
			pstmt.setString(4, text);
			pstmt.setString(5, num);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("updateBoard SQL 에러입니다!");
		}
	}
	
	
}
