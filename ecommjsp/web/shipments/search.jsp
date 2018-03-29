<%--
    Document   : shipmentCalcuForm
    Created on : Mar 24, 2018, 9:34:23 AM
    Author     : foush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

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

<jsp:include page="includes/header.html"/>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Category</a></li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<jsp:include page="includes/sidebar.html"/>


<div class="col">
            <div class="row">

<%
String productName="";

if(request.getParameter("productName") != null){
    productName = request.getParameter("productName");
    productName=productName.toLowerCase();
}




     //
// database work
//
try{
// JDBC driver name and database URL
 String JDBC_DRIVER = "com.mysql.jdbc.Driver";
 String DB_URL = "jdbc:mysql://localhost/Ecommerce";

//  Database credentials
 final String USER = "root";
 final String PASS = "";
// open a connection
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");  // load the driver
System.out.println("Connecting to database...");
conn = DriverManager.getConnection(DB_URL,USER,PASS);
// create the sql command
System.out.println("Creating statement...");

PreparedStatement prep = conn.prepareStatement("Select * from products_t WHERE product_name=?");
prep.setString(1,productName);

ResultSet rs = prep.executeQuery();
  // process results one row at a timne
  while(rs.next())
  {

%>

                  <div class="col-12 col-md-6 col-lg-4">
                      <div class="card" style="margin-bottom: 20px;">
                          <img class="card-img-top" src="../Design/shipments/images/fff.png" alt="Card image cap">
                          <div class="card-body">
                          <%out.println("<h4 class='card-title'>"+"<a href='product.jsp' title='View Product'>"+rs.getString(2)+"</a>"+"</h4>");%>
                          <%out.println("<p>"+rs.getString(3)+"</p>");%>
                              <div class="row">
                                  <div class="col">
                                  <%out.println("<p class='btn btn-danger btn-block'>"+rs.getString(4)+"$"+"</p>");%>
                                  </div>
                                  <div class="col">
                                      <a href="#" class="btn btn-success btn-block">Add to cart</a>

                                  </div>
                              </div>
                          </div>
                      </div>

                  </div>



<%

}
     prep.close();
     conn.close();
    }
    catch(Exception ex)
    {
      out.println("Sorry, the system is unavailable<br/>");
      out.println(ex.toString()+"<br/>");
    }

%>

















</div>
</div>
</div>
</div>



<div style="margin-top:50px;"></div>


<jsp:include page="includes/footer.html"/>

    </body>
</html>
