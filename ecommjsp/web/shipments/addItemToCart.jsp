<%--
    Document   : addItemToCart
    Created on : Mar 28, 2018, 3:33:23 AM
    Author     : foush
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registrarbeans.*"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="item" class="registrarbeans.Item" scope = "request" />
<jsp:useBean id="cart" class="registrarbeans.ShoppingCart" scope ="session" />
<jsp:setProperty name="item" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
    </head>
    <body>

   <%
    //
    // set the session's inactive interval
    //
     session.setMaxInactiveInterval(1800); // 30 minutes

    //
    // now add the item to the cart
    //
    synchronized(session)  // lock the session
    {
       cart.add(item); // cart uses ArrayList which is not thread safe so we locked
       cart.display(out); // tell the cart to send its contents to the browser
     }
    %>
    </body>
</html>
