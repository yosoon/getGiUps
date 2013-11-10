<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<html>
<head>
<title>wonderful world</title>
</head>
<body>


	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			String jdbcDriver = "jdbc:mysql://localhost:3306/gom?useUnicode=true&characterEncoding=UTF-8";
			String dbUser = "root";
			String dbPass = "Chaos";
			
			String query = "select * from user";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
	%>

	<%=rs.getString("Email")%>
	<%=rs.getString("Password")%>

	<%
		}
		} catch (Exception ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	%>


</body>
</html>