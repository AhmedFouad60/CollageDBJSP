<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="registrarbeans.ShoppingCart" scope ="session" />
<%@page errorPage = "errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove</title>
    </head>
    <body>
     <%


          session.setMaxInactiveInterval(1800); // make session expire after 30 minutes
          //
          // Remove the item
          String idstr = request.getParameter("id");
          try
          {
           int id = Integer.parseInt(idstr);
            synchronized(session)  // lock the session
            {
             cart.remove(id);
            }
          }
          catch(Exception ex)
          {
            out.println("Error: "+ ex.toString()+ "<br/>");
          }
          cart.display(out);
          %>
    </body>
</html>
