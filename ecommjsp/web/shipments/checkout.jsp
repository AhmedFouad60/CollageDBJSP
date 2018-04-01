<%--
    Document   : checkout
    Created on : Mar 31, 2018, 9:15:11 AM
    Author     : foush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dbShipmentUtility.*"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="item" class="dbShipmentUtility.Item" scope = "request" />
<jsp:useBean id="shipping" class="dbShipmentUtility.ShippingAlgorithm" scope = "request" />
<jsp:useBean id="cart" class="dbShipmentUtility.ShoppingCart" scope ="session" />
<jsp:setProperty name="item" property="*" />

<!DOCTYPE html>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

      <link rel="stylesheet" href="../Design/shipments/css/main.css" />

  </head>
    <body>
<%

  String AddressSource= "";
  String AddressDest= "";
  String sourceZone=null;
  String destZone="";
  double firstKiloCost=0;
  double secondKiloCost=0;
  double shippingCost=0;

  if(request.getParameter("address-line1") != null)
             AddressSource = request.getParameter("address-line1");
  if(request.getParameter("address-line2") != null)
            AddressDest = request.getParameter("address-line2");

//from the city , i got the source zone and the destZone
                 sourceZone=shipping.WhichZone(AddressSource);
                 destZone=shipping.WhichZone(AddressDest);
out.println("<div class='btn btn-success'>"+sourceZone+"</div>");
out.println("<div class='btn btn-success'>"+destZone+"</div>");

                 firstKiloCost=shipping.KiloCost(sourceZone,destZone,"1");
                 secondKiloCost=shipping.KiloCost(sourceZone,destZone,"0");
                 out.println("<div class='btn btn-success'>"+firstKiloCost+"</div>");
                 out.println("<div class='btn btn-success'>"+secondKiloCost+"</div>");


//calculate the shipping cost
shippingCost=shipping.costCalculation(firstKiloCost,secondKiloCost,cart);









%>









      <jsp:include page="includes/header.html"/>
      <section class="jumbotron text-center">
          <div class="container">
              <h1 class="jumbotron-heading">Shipping information</h1>
              <p class="lead text-muted mb-0">please enter your Shipping information below the cart info .To get you the best shipping company</p>
          </div>
      </section>
      <div class="container test-center">
      <h1 class="text-center alert-success" >Cart info</h1>
    </div>
      <%
       //
       // set the session's inactive interval
       //
        session.setMaxInactiveInterval(1800); // 30 minutes

        //
        // Remove the item

        String idstr = request.getParameter("id");
        try
        {
          idstr="0";
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
       <jsp:include page="includes/postalAddressform.html"/>






     </div>
     </div>
     </div>
     </div>
 <jsp:include page="includes/footer.html"/>
    </body>
</html>
