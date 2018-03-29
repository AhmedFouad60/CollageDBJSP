<%--
    Document   : cart
    Created on : Mar 28, 2018, 4:18:46 AM
    Author     : foush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbShipmentUtility.*"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="item" class="dbShipmentUtility.Item" scope = "request" />
<jsp:useBean id="cart" class="dbShipmentUtility.ShoppingCart" scope ="session" />
<jsp:setProperty name="item" property="*" />
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Cart Page</title>
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

      <link rel="stylesheet" href="../Design/shipments/css/main.css" />
    </head>
    <body>
      <jsp:include page="includes/header.html"/>

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





                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <a href="index.jsp" class="btn btn-block btn-light">Continue Shopping</a>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <button class="btn btn-lg btn-block btn-success text-uppercase">Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>















    </div>
  </div>
  <jsp:include page="includes/footer.html"/>

    </body>
</html>
