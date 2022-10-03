package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import dbCon.SqlDbConnection;
import dto.BoardDto;

public class BoardDao {
	
	private SqlDbConnection dbCon = new SqlDbConnection();;
	
	public ArrayList<BoardDto> boardList(){
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		ArrayList<BoardDto> list = new ArrayList<>();
		
		
		try {
			//mysql db connection
		    con = dbCon.getConnection();
			
			String sql = "select * from board_tb";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto bean = new BoardDto();
				
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				
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

}
