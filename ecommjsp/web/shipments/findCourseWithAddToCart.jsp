<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses</title>
    </head>
    <body>
        <h1>Courses that match</h1>
        <%
          String course = "";
          String title = "";
          String instructor = "";
          String seatsleftStr = "0";
          if(request.getParameter("course") != null)
              course = request.getParameter("course");
           if(request.getParameter("title") != null)
             title = request.getParameter("title");
           if(request.getParameter("instructor") != null)
              instructor = request.getParameter("instructor");
           if(request.getParameter("seatsleft") != null)
             seatsleftStr= request.getParameter("seatsleft");
          int seatsleft = 0;
       try{
           seatsleft = Integer.parseInt(seatsleftStr);
         }
       catch(Exception ex1)
      {
         out.println("Invalid value for seats left, using 0<br/>");
       }

    //
   // database work
   //
        try{
         // open a connection
          Connection con = null;
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  // load the driver
          con = DriverManager.getConnection("jdbc:sqlserver://rubble.student.ad.fgcu.edu:1433;databaseName=sp12ism3232x;user=s12ISM3232;password=s12ISM3232;");
      // create the sql command
          PreparedStatement prep = con.prepareStatement("Select * from courseschedule where course like ? and title like ? and instructor like ? and seatsleft >= ?");
          prep.setString(1,course+"%");
          prep.setString(2,"%"+title+"%");
          prep.setString(3,instructor+"%");
          prep.setInt(4,seatsleft);

          ResultSet rs = prep.executeQuery();
   %>
    <table border ="1">
        <tr>
         <td>CRN </td>
         <td>Course</td>
         <td>Title </td>
         <td>Credits </td>
         <td>Instructor </td>
         <td>Max seats</td>
         <td>Seats left</td>
         <td>College </td
        </tr>
     <%
          // process results one row at a timne
          while(rs.next())
          {
          out.println("<tr>");
          out.println("<td>"+rs.getString(1)+"</td>");
          out.println("<td>"+rs.getString(2)+"</td>");
          out.println("<td>"+rs.getString(3)+"</td>");
          out.println("<td>"+rs.getString(4)+"</td>");
          out.println("<td>"+rs.getString(5)+"</td>");
          out.println("<td>"+rs.getString(6)+"</td>");
          out.println("<td>"+rs.getString(7)+"</td>");
          out.println("<td>"+rs.getString(8)+"</td>");
          out.println("<td><a href='deleteCourse.jsp?CRN="+rs.getString(1)+"'><input type='button' value='delete'/></A></td>");
          String name =rs.getString(2)+" "+rs.getString(3);
          name = java.net.URLEncoder.encode(name, "UTF-8");  // fix name into a url ok
          out.println("<td><a href='addItemToCart.jsp?id="+rs.getString(1)+"&name="+name+"&quantity=1&price=9.95"+
                       "'><input type='button' value='add'/></A></td>");

           out.println("</tr>");
          }

%>
    </table>
<%
         prep.close();
         con.close();
        }
        catch(Exception ex)
        {
          out.println("Sorry, the system is unavailable<br/>");
          out.println(ex.toString()+"<br/>");
        }

        %>
    </body>
</html>
