<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	//클라이언트가 넘긴 파라미터를 받아서 , db에 넣는다!!
	
	request.setCharacterEncoding("utf-8");
	
	String title=request.getParameter("title");
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	
	System.out.println(title); //콘솔 로그에 출력..왜?? 클라이언트가 브라우저가 아니니깐..
			
	//db에 데이터 넣기!!
	Class.forName("com.mysql.jdbc.Driver");//동적 클래스 로드 ( 실행타임에 해당 클래스 로드!!)
	out.print("드라이버 로드 성공");
	
	//데이터베이스  접속  (원격지의 서버에 접속하므로, ip, 도메인 을 알아야 한다..)
	String url="jdbc:mysql://localhost:3306/android";
	String id="root";
	String pwd="0000";
	
	Connection con=null;
	con=DriverManager.getConnection(url, id, pwd);//접속 시도!!
	if(con!=null){ //con이 메모리에 올라오면 접속 성공한 것임...
		out.print("접속 성공");
	}else{
		out.print("접속 실패");
	}
	
			
%>






