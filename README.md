# db-ecommerce
![](https://i.imgur.com/RCvlfbV.png)
- [X]  Business Rules.
- [X]  EER.
- [X]  Branches.
- [X]  Emplyees.
- [X]  Products.
- [X]  Customers.
- [X]  Orders.
- [X]  Payments.
- [X]  Shipments.

## Some Details


Goals:

Using all available aspects to create online shopping meeting the market needs from scientific,financial and morality meaning aims the market for continuing and rises the level of trading and relations between clients, merchants,manufacturers,markets and shopping companies and facilitates shipping products.

### Business Roles

1. The Ecommerce Market sells a number of different products. These products are
grouped into several categories.the products categories must be one of these types special offers OR Recycled product or normal product.

> The identifier for a product is Product ID [primary key] AND product Category [primary key],. We identify the fol-
lowing additional attributes for product: Product Description[==Entity==], and
Product Standard Price.


2. Customers submit orders for products. The identifier for an order is Order ID[primary key], and		{Relationship:customer & order}
another attribute is Order Date,shipping Cycle[drived attribute]. A customer may submit any number of orders
but need not submit any orders. Each order is submitted by exactly one customer.

3. The identifier for a customer is Customer ID. Other attributes include Customer			
Name, Customer Address, and Customer Postal Code

> A given customer order must request at least one product                             {Relationship:product & order}


4. Our Company has several shipment companies supporter. The identifier for a shipment Company is shipment ID. Other attributes include shipment Name, shipment
Telephone, and shipment Fax.


5. products are supplied by vendors. The identifier for a vendor is Vendor ID.
Other attributes include Vendor Name and Vendor Address. Each product
can be supplied by one or more vendors. A vendor may supply any number of
products or may not supply any products to the Ecommerce.
\*
Supply Unit Price is the unit price at which a particular vendor supplies a
particular product.*/

6. The Ecommerce has established a number of work centers. The identifier for
a work center is Work Center ID. Another attribute is Work Center Location. Each
product is produced in one or more work centers. A work center may be used to
produce any number of products or may not be used to produce any products.



6. The company has more than 100 employees. The identifier for employee is
Employee ID. Other attributes include Employee Name, Employee Address, and
Skill. An employee may have more than one skill. Each employee may work in one
or more work centers. A work center must have at least one employee w
­ working in
that center but may have any number of employees. A skill may be possessed by
more than one employee or possibly no employees.

7. Each employee has exactly one supervisor; however, a manager has no supervisor.
An employee who is a supervisor may supervise any number of employees, but
not all employees are supervisors.



8. Any customer from one of their accounts may file a
complaint about any order.Each com-
plaint has a Complaint ID, Date/Time the com-
plaint is posted, the Content of the complaint, and
a Resolution Code. Complaints and the status of
resolution are visible to only the person making the
complaint and to the site administrator.

9. the customer can pay using many methods includes visa, ........ 

10. the customer may subscribe to the newsletter for new product info
11. our company Must send crystal letter for thinking the customer ... and offer after sell service includes new accessories related to sold product 

12. Maintenance,Retrieve deleted data and soft deletion services 




13. our administrative structure Must have admins ..the attributes for the admin includes privileges ,admin type





/*Extra info*/



Description[==Entity==]{

	"product water mark":{
				'apple',
				'lenovo',
				'hp'
			}
	"product-color":{
		}
	"size":{}
	"weight":{}


}



Point 12    {soft deletion}:

Soft deleted means that although you have deleted the record through Service Desk the object has been set to soft delete the record.  Therefore instead of completely removing the record it will flag the record as deleted.  For example if you delete an analyst record through Administration it is kept in the database for historic reporting purposes.  You can then still query on this analyst record through query tool  but you will not see it in the Administration list of analysts or when assigning to analysts.  To find all records which have been soft deleted you would query on where deleted = 1.






