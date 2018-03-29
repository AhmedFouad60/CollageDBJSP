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
public class ShoppingCart {
  ArrayList<Item> itemlist = new ArrayList<Item>();  // list of Items in the cart
   java.text.DecimalFormat currency = new java.text.DecimalFormat("$ #,###,##0.00");

   public ShoppingCart()
       {

       }

   public void empty()
     {
       itemlist.clear();
     }
     //
     // add an item to the cart
     // if its there already, just update
     //

     public void add(Item anitem)
    {

     for(int i = 0; i < itemlist.size(); i++)
     {
     Item item = itemlist.get(i);
      if(anitem.id == item.id) // already in the cart?
      {
       item.quantity += anitem.quantity; // yes, just update the quantity
       return;
      }
     }
     itemlist.add(anitem); // no, add it as a new item
    }
    //
    // remove an item with a given id from the shopping cart
    //
        public void remove(int id)
        {

         for(int i = 0; i < itemlist.size(); i++)
         {
          Item item = itemlist.get(i);
          if(id == item.id) // item in the cart?
          {
           itemlist.remove(i); // remove it
           break;
          }
         }

        }

    //
   // Display the current contents of the cart as an html table
   //
   public void display(JspWriter out) throws IOException
     {
      //
      // start the table and output the header row
      //
    out.println("<div class='container mb-4'>");
    out.println("<div class='row'>");
        out.println("<div class='col-12'>");
        out.println("<div class='table-responsive'>");
        out.println("<table class='table table-striped'>");

      out.println("<thead>");
      out.println("<tr>");
      out.println("<th scope='col'> </th>");
      out.println("<th scope='col'>Name</th>");
      out.println("<th scope='col'>Quantity</th>");
      out.println("<th scope='col' class='text-left'>Price</th>");
      out.println("<th> </th>");
      out.println("</tr>");
      out.println("</thead>");
      out.println("<tbody>");



      double total = 0;
      //
      // output one item at a time from the cart, one item to a row table
      //
      for(int i = 0; i < itemlist.size(); i++)
      {
       Item item = (Item)itemlist.get(i);
       out.println(
                  "<td>"+"<img src='https://dummyimage.com/50x50/55595c/fff'/>"+"</td>"+
                  "<td>"+item.name+"</td>"+
                  "<td align=left>"+ item.quantity+"</td>"+
                  "<td align=left>"+ currency.format(item.price)+"</td>"+
                  "<td align=left>"+ currency.format(item.price*item.quantity)+"</td>"+
                  "<td class='text-left'><A class='btn btn-sm btn-danger' href='cart.jsp?id="+item.id+"'><i class='fa fa-trash'></i></A></TD></tr>");
       total += item.price*item.quantity;
      }
      //
      // add summary information (total, tax, grand total)
      //

       //out.println("<a href='checkOut.jsp'><input type='Button' value='Register'/></A><br/>");
out.println("<tr>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td>Sub-Total</td>");
out.println("<td class='text-left'>255,90 €</td>");
out.println("</tr>");

out.println("<tr>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td>Shipping</td>");
out.println("<td class='text-left'>6,90 €</td>");
out.println("</tr>");

out.println("<tr>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td></td>");
out.println("<td>"+"<strong>"+"Total"+"</strong>"+"</td>");
out.println("<td class='text-left'>"+"<strong>"+"346,90 €"+"</strong>"+"</td>");
out.println("</tr>");



out.println("</table>");
  out.println("</tbody>");





     }

     public int checkOut(String url, String studentid)//url is the DB ,that i want to connect to
         {
             int result = 0; // tally the classes added
             try{
             // open a connection
               Connection con = null;
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  // load the driver
               con = DriverManager.getConnection(url);
     //
     // add entry to enroll table for each item
     //
             PreparedStatement prep = con.prepareStatement("Insert into enroll (StudentID, CRN) values (?,?)");

             for(int i = 0; i < itemlist.size(); i++)
             {
                Item item = itemlist.get(i);
                prep.setString(1, studentid);
                prep.setInt(2, item.id);
                result += prep.executeUpdate();
             }
             itemlist.clear(); //empty the cart
             prep.close();
             con.close();
             }
             catch(Exception ex)
             {
               // unable to close the prepared statement
             }
             return result;
         }












}
