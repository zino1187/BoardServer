<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/xml;charset=utf-8" %>
<%!
		Connection con=null; //접속 후 그 정보를 보유한 객체!!
		PreparedStatement pstmt=null; //쿼리문 수행 객체  DML(insert, update,delete), select
		ResultSet rs=null; //select문 수행후 반환되는 결과를 담는 객체!!
%>
<%
	//데이터베이스 연동!!
	Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클용
	//Class.forName("com.mysql.jdbc.Driver"); //mysql 용
	
	//데이터베이스 접속!! 오라클용
	
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="spring";
	String pwd="spring";
	con=DriverManager.getConnection(url, user, pwd);
 		
	//데이터베이스 접속!! Myql	
/* 	String url="jdbc:mysql://localhost:3306/android";
	String user="root";
	String pwd="123456";
	con=DriverManager.getConnection(url, user, pwd);
 */	
	if(con !=null){
		//out.print("접속 성공");
	}else{
		//out.print("접속 실패");
	}
	
	//쿼리문 수행!!
	String sql="select * from board order by board_id desc";
	pstmt=con.prepareStatement(sql); //쿼리문 수행하기 위한 객체 생성!!
	rs=pstmt.executeQuery(); // select문의 결과를 담는다!!  rs는 마치 표와 같다!!
%>
<boards>
	<%while(rs.next()){%>
	<board>
		<board_id><%=rs.getInt("board_id")%></board_id>
		<title><%=rs.getString("title")%></title>
		<writer><%=rs.getString("writer")%></writer>
		<content><%=rs.getString("content")%></content>
		<regdate><%=rs.getString("regdate")%></regdate>
		<hit><%=rs.getInt("hit")%></hit>	
	</board>
	<%} %>
</boards>
<%
	rs.close();
	pstmt.close();
	con.close();
%>


