 ## Prompt Questions ##

1) What classes does each implementation include? Are the lists the same?
Implementation A - CartEntry, ShoppingCart, Order
Implementation B - CartEntry, ShoppingCart, Order
The entries are equivalent, both have empty arrays, nothing has been passed into the entries array for Implementation A or B.

2) Write down a sentence to describe each class.
CartEntry - assigns a unit price and quantity to an item that will be stored in a shopping cart object.  

ShoppingCart - creates an empty array to be populated with CartEntry objects.

Order - Returns total price, including sales tax of all CartEntry objects within a ShoppingCart object.

3) How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

A shopping cart should have a “has-a” relationship with CartEntry objects since they are stored within the array of the ShoppingCart class. Order class should have a has-a relationship with the Order class since it uses the ShoppingCart method to be able to traverse CartEntry objects. I'm still not clear how the connection between ShoppingCart and Order would be made since a new object is made in the constructor of Order and the Order class does not have an attr_accessor method.

4)What data does each class store? How (if at all) does this differ between the two implementations?
  Implementation A
    CartEntry - unit_price, quantity
    ShoppingCart - entries
    Order - cart, sum

  Implementation B
    CartEntry - unit_price, quantity
    ShoppingCart - entries, sum
    Order - cart, subtotal

Implementation B has the sum (price before tax) included in the ShoppingCart class in addition to a subtotal value (price after tax). All other values are equivalent.

5) What methods does each class have? How (if at all) does this differ between the two implementations?
  Implementation A
    CartEntry - initialize, accessor-unit_price, accessor-quantity
    ShoppingCart - initialize, accessor-entries
    Order - initialize, total_price

  Implementation B
    CartEntry - initialize, price
    ShoppingCart - initialize, price
    Order - initialize, total_price

  Implementation B doesn't include the accessor methods and includes a price method for both the CartEntry and ShoppingCart classes. Without an attr_accessor a user/coder wouldn't be able to modify an original entry which could make dealing with a mistaken order more difficult later in the code.

6) Consider the Order#total_price method. In each implementation:
  6.a) Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
        In implementation B, the logic to calculate pre-tax price is kept within the ShoppingCart class which freed up the Order#total_price method to be much less lines of code when compared to Implementation A which needed to reference CartEntry objects individually.  
  6.b)Does total_price directly manipulate the instance variables of other classes?
      No both either modify local variables within the Order class.

7) If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  Implementation B is easier to modify. We could modify the price method within the CartEntry to reflect at a certain quantity to reduce the unit_price attribute by a certain amount.

8) Which implementation better adheres to the single responsibility principle?
  Implementation B is a better reflection of the single responsibility principle. Implementation B’s classes know more information about their own data (CartEntry knows price, ShoppingCart knows price). So, when it comes time to using the data within other classes, new behaviors are much more simple if needed at all(i.e Implementation B Order’s total_price .each method).

9) Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
  I think Implementation B is more loosely coupled. Keeping information like price within the lower classes has made referencing/building code in the more abstract class Order more simple.

  ## Hotel Changes ##

1) In Admin#total_cost I removed the lines of code that were traversing all reservations to find a match with a passed in reservation and output the total price. The admin class was performing a reservation behavior, the new update has a single line that returns the object with a call to the cost method.

2) Admin#available_rooms was, with each reservation, modifying the rooms array attribute set in the constructor which was not my original intent. The all_available_rooms array was set equal to the all_rooms array which just created another reference to the attribute array. A test was not in place to check that the array was constant after the all_available_rooms method was run so this wasn’t caught. I added a new test to check if the rooms array remained constant and used the .dup method to copy the information over.

3) Added a new test for a reservation made between the start / end date of a current reservation.
