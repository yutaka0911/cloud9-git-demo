add_name.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");
// データベースに接続
Connection connect = DriverManager.getConnection(
                     "jdbc:mysql://localhost:3306/sample_db?" +
                     "UTF-8&serverTimezone=JST",
                     "root", "rootPassword1234!");

PreparedStatement ps = connect.prepareStatement
    ("INSERT INTO names (name) values (?)");

String name = request.getParameter("name");
ps.setString(1, request.getParameter("name"));
ps.executeUpdate();

connect.close();
ps.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database Test</title>
</head>
<body>
<p><%=name %>さんを追加しました。</p>
<a href="add_name.html">戻る</a>
</body>
</html>