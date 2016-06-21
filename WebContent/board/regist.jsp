<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%!
	//선언부 : 이 jsp가 서블릿으로 변경될때, 이영역에 선언한 변수와 메서드는 
	//멤버변수와 메서드가 된다...
	Connection con=null;
	PreparedStatement pstmt=null;
%>
<%
	//클라이언트가 넘긴 파라미터를 받아서 , db에 넣는다!!
	
	request.setCharacterEncoding("utf-8");
	
	String title=request.getParameter("title");
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	
	System.out.println(title); //콘솔 로그에 출력..왜?? 클라이언트가 브라우저가 아니니깐..
			
	//db에 데이터 넣기!!
	Class.forName("oracle.jdbc.driver.OracleDriver");//동적 클래스 로드 ( 실행타임에 해당 클래스 로드!!)
	out.print("드라이버 로드 성공");
	
	//데이터베이스  접속  (원격지의 서버에 접속하므로, ip, 도메인 을 알아야 한다..)
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String id="spring";
	String pwd="spring";
	
	con=DriverManager.getConnection(url, id, pwd);//접속 시도!!
	System.out.println(con);
	
	if(con!=null){ //con이 메모리에 올라오면 접속 성공한 것임...
		//out.print("접속 성공");
		String sql="insert into board(board_id,title,writer,content) values(seq_board.nextval,?,?,?)";
		pstmt=con.prepareStatement(sql); 
		
		pstmt.setString(1, title );
		pstmt.setString(2, writer);
		pstmt.setString(3, content);
		
		int result=pstmt.executeUpdate(); //쿼리 실행 시점!!!
		out.print("{");
		out.print("\"resultCode\":"+result+"");
		out.print("}");
	}else{
		System.out.println("오라클 접속이 않되고 있으니 확인하자!");
	}
	
			
%>






