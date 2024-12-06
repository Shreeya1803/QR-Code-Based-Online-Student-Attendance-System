<%@page import="QRAttendance.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String selectedMonth = request.getParameter("selectedMonth");
    String year = selectedMonth.substring(0, 4);
    String month = selectedMonth.substring(5);
    String uid = request.getParameter("uid");
    System.out.println(selectedMonth);

    try {
        Connection connection = SQLconnection.getconnection();
        String query = "SELECT date FROM attendance WHERE YEAR(date) = ? AND MONTH(date) = ? AND uid = ? AND is_present = true";

        StringBuilder presentDates = new StringBuilder();

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, year);
            preparedStatement.setString(2, month);
            preparedStatement.setString(3, uid);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    if (presentDates.length() > 0) {
                        presentDates.append(",");
                    }
                    presentDates.append(resultSet.getDate("date").toString());
                }
            }
        }

        if (presentDates.length() == 0) {
            response.sendRedirect("CheckAttendance.jsp?NoRecord");
        } else {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM students WHERE id='" + uid + "' ");
            rs.next();
            String name = rs.getString("name");
            String sdept = rs.getString("sdept");
            String syear = rs.getString("syear");
            String rollno = rs.getString("rollno");

            // Pass present dates as a parameter
            response.sendRedirect("AtteendanceDetails.jsp?presentDates=" + presentDates + "&sdept=" + sdept + "&name=" + name + "&syear=" + syear + "&rollno=" + rollno);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
