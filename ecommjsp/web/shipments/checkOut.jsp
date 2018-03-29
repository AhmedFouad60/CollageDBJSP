<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="registrarbeans.ShoppingCart" scope ="session" />
<jsp:useBean id="student" class="registrarbeans.Student" scope="session" />
<%@page errorPage = "errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>
    <body>
        <%
         session.setMaxInactiveInterval(1800); // make session expire after 30 minutes

          if(student.isLoggedIn())
          {
           synchronized(session)
            {
             cart.checkOut("jdbc:sqlserver://rubble.student.ad.fgcu.edu:1433;databaseName=sp12ism3232x;user=s12ISM3232;password=s12ISM3232;", student.getId() );
            }
         }
         else
           response.sendRedirect("login.html");

        %>
    </body>
</html>
