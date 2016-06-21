<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!
	Connection con=null;
	PreparedStatement pstmt=null;
%>
<%
	//클라이언트가 넘긴 파라미터를 받아서 , db에 넣는다!!
	
	request.setCharacterEncoding("utf-8");
	
	String board_id=request.getParameter("board_id");
	
	//db에 데이터 넣기!!
	Class.forName("oracle.jdbc.driver.OracleDriver");//동적 클래스 로드 ( 실행타임에 해당 클래스 로드!!)
	
	//데이터베이스  접속  (원격지의 서버에 접속하므로, ip, 도메인 을 알아야 한다..)
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String id="spring";
	String pwd="spring";
	
	con=DriverManager.getConnection(url, id, pwd);//접속 시도!!
	System.out.println(con);
	
	if(con!=null){ //con이 메모리에 올라오면 접속 성공한 것임...
		//out.print("접속 성공");
		String sql="delete from board where board_id=?";
		pstmt=con.prepareStatement(sql); 
		
		pstmt.setInt(1, Integer.parseInt(board_id));

		
		int result=pstmt.executeUpdate(); //쿼리 실행 시점!!!
		out.print("{");
		out.print("\"resultCode\":"+result+"");
		out.print("}");
	}else{
		System.out.println("오라클 접속이 않되고 있으니 확인하자!");
	}
	
			
%>

