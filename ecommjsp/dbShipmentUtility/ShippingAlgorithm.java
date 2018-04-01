/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 package dbShipmentUtility;

 import java.io.IOException;
 import java.util.ArrayList;
 import javax.servlet.jsp.JspWriter;
 import java.sql.*;
/**
 *
 * @author foush
 */
public class ShippingAlgorithm {

   public ShippingAlgorithm()
       {

       }



public String WhichZone(String city){//url is the DB ,that i want to connect to

  String result = "";
  try{
    // JDBC driver name and database URL
     String JDBC_DRIVER = "com.mysql.jdbc.Driver";
     String DB_URL = "jdbc:mysql://localhost/Ecommerce";
    //  Database credentials
     final String USER = "root";
     final String PASS = "";

  // open a connection
    Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");  // load the driver
    con = DriverManager.getConnection(DB_URL,USER,PASS);
  //
  // get the city's zone
  //
  PreparedStatement prep = con.prepareStatement("Select * from cities_t WHERE city_name=?");

     prep.setString(1, city);
ResultSet rs = prep.executeQuery();
while(rs.next()){
   result=rs.getString(3);
}
  prep.close();
  con.close();
  }
  catch(Exception ex)
  {
    // unable to close the prepared statement
  }

return result;

}



public double KiloCost(String sourceZone,String destZone,String firstOrAdditional){
  //return the fist/additional kilo of shipping of all companies    1 --> first    0 ---> Additional

  double BestPrice =0;
  double NextPrice=0;
  try{
    // JDBC driver name and database URL
     String JDBC_DRIVER = "com.mysql.jdbc.Driver";
     String DB_URL = "jdbc:mysql://localhost/Ecommerce";
    //  Database credentials
     final String USER = "root";
     final String PASS = "";

  // open a connection
    Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");  // load the driver
    con = DriverManager.getConnection(DB_URL,USER,PASS);
  //
  // get the city's zone
  //
  PreparedStatement prep = con.prepareStatement("Select * from shipping_rates_t WHERE zone_source=? AND zones_destination=? AND isFirst=?");

     prep.setString(1, sourceZone);
     prep.setString(2, destZone);
     prep.setString(3, firstOrAdditional);
  ResultSet rs = prep.executeQuery();
if (rs.next()) {
BestPrice=Double.parseDouble(rs.getString(5));
}
  while(rs.next()){


    //Here i have all the records of all shipping companies' 1'st kilo price
    NextPrice=Double.parseDouble(rs.getString(5));
    if(NextPrice < BestPrice){BestPrice=NextPrice;}
     //result=rs.getString(3);
  }
  prep.close();
  con.close();
  }
  catch(Exception ex)
  {
    // unable to close the prepared statement
  }

//return the smallest price :)
//return BestPrice;
return BestPrice;
}



//public double costCalculation(int firstKiloCost,int secondKiloCost,ArrayList<Item> itemlist){
  //return the total price =price +shipping cost
//}














}
