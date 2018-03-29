/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbShipmentUtility;

/**
 *
 * @author foush
 */
public class Item {
  int id = 0;
  String name = "";
  int quantity = 0;
  double price = 0;
  public Item()
 {

 }

 //
   // Setters methods
   //
     public void setId(int n)
     {
       id = n;
     }
      public void setName(String s)
     {
      name = s;
     }
      public void setQuantity(int n)
     {
       quantity = n;
     }

     public void setPrice(double n)
     {
       price = n;
     }

   //
   // Getters methods
   //
    public int getId()
    {
      return id;
    }
    public String getName()
    {
      return name;
    }

   public int getQuantity()
   {
    return quantity;
   }

   public double getPrice()
   {
     return price;
   }

   @Override
      public String toString()
      {
        return id+" "+name+" "+quantity +" @ "+price;
      }




}
