<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="registrarbeans.Student" scope="session" />
<%@page errorPage = "errorPage.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course schedule</title>
    </head>
    <body>
        <h2>Courses</h2>
        <%

          if(!student.isLoggedIn())
             response.sendRedirect("login.html");
          else
          {

           try{
            // load the driver and create the connection
            Connection con = null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  // load the driver
            con = DriverManager.getConnection("jdbc:sqlserver://rubble.student.ad.fgcu.edu:1433;databaseName=sp12ism3232x;user=s12ISM3232;password=s12ISM3232;");

            PreparedStatement prep = con.prepareStatement("select courseSchedule.crn, courseSchedule.title, courseSchedule.instructor from courseschedule, enroll where enroll.studentid =  ? and  courseschedule.crn = enroll.crn");
            prep.setString(1,student.getId());
            ResultSet rs = prep.executeQuery();
            out.println("<table>");
            out.println("<tr><th>CRN</th><th>Title</th><th>Instructor</th></tr>");
            while(rs.next())
            {
              out.println("<tr>");
              out.println("<td>"+rs.getString(1)+"</td>");
              out.println("<td>"+rs.getString(2)+"</td>");
              out.println("<td>"+rs.getString(3)+"</td>");
              out.println("</tr>");
            }
            out.println("</table>");
            prep.close();

            con.close();

            }
            catch(Exception ex)
            {
             out.println("Sorry, system is unavailable");
             out.println(ex.toString());

            }
        }
    %>

    </body>
</html>
