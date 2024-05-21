import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delevery_app/models/cart_item.dart';
import 'package:food_delevery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  // here this is our main class that is storing the collections
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "Juicy beef patty topped with melted cheese and classic condiments.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 8.99,
      catagory: FoodCatagory.burgers,
      availableAddon: [
        Addon(name: "Bacon", price: 1.50),
        Addon(name: "Extra Cheese", price: 0.75),
        Addon(name: "Avocado", price: 1.25),
      ],
    ),
    Food(
      name: "Bacon BBQ Burger",
      description: "Succulent burger with crispy bacon and tangy BBQ sauce.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 9.99,
      catagory: FoodCatagory.burgers,
      availableAddon: [
        Addon(name: "Onion Rings", price: 2.00),
        Addon(name: "Jalapenos", price: 1.25),
        Addon(name: "Fried Egg", price: 1.50),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "Grilled vegetarian patty served with fresh veggies and sauce.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 7.99,
      catagory: FoodCatagory.burgers,
      availableAddon: [
        Addon(name: "Hummus Spread", price: 1.00),
        Addon(name: "Guacamole", price: 1.50),
        Addon(name: "Pepper Jack Cheese", price: 0.75),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      description:
          "Beef patty topped with sautéed mushrooms and melted Swiss cheese.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 9.49,
      catagory: FoodCatagory.burgers,
      availableAddon: [
        Addon(name: "Truffle Aioli", price: 1.75),
        Addon(name: "Caramelized Onions", price: 1.25),
        Addon(name: "Balsamic Glaze", price: 1.50),
      ],
    ),
    Food(
      name: "Double Patty Burger",
      description:
          "Double the beef, double the flavor! Two juicy patties stacked high.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 10.99,
      catagory: FoodCatagory.burgers,
      availableAddon: [
        Addon(name: "Bacon Jam", price: 2.00),
        Addon(name: "Fried Pickles", price: 1.75),
        Addon(name: "Blue Cheese Crumbles", price: 1.50),
      ],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce with parmesan cheese, croutons, and Caesar dressing.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 7.49,
      catagory: FoodCatagory.salads,
      availableAddon: [
        Addon(name: "Grilled Chicken", price: 2.50),
        Addon(name: "Shrimp", price: 3.00),
        Addon(name: "Avocado", price: 1.25),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "Fresh lettuce, tomatoes, cucumbers, olives, and feta cheese with Greek dressing.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 8.99,
      catagory: FoodCatagory.salads,
      availableAddon: [
        Addon(name: "Lamb Gyro", price: 3.50),
        Addon(name: "Artichoke Hearts", price: 1.75),
        Addon(name: "Pepperoncini", price: 1.00),
      ],
    ),
    Food(
      name: "Cobb Salad",
      description:
          "Mixed greens topped with grilled chicken, bacon, avocado, eggs, and blue cheese crumbles.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 9.99,
      catagory: FoodCatagory.salads,
      availableAddon: [
        Addon(name: "Ranch Dressing", price: 0.75),
        Addon(name: "Turkey Breast", price: 2.00),
        Addon(name: "Sliced Almonds", price: 1.25),
      ],
    ),
    Food(
      name: "Garden Salad",
      description: "Fresh garden vegetables with your choice of dressing.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 6.99,
      catagory: FoodCatagory.salads,
      availableAddon: [
        Addon(name: "Grilled Tofu", price: 2.50),
        Addon(name: "Dried Cranberries", price: 1.00),
        Addon(name: "Sunflower Seeds", price: 0.75),
      ],
    ),
    Food(
      name: "Spinach and Strawberry Salad",
      description:
          "Baby spinach, sliced strawberries, goat cheese, and candied pecans with balsamic vinaigrette.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 8.49,
      catagory: FoodCatagory.salads,
      availableAddon: [
        Addon(name: "Grilled Salmon", price: 4.00),
        Addon(name: "Red Onion", price: 0.50),
        Addon(name: "Poppyseed Dressing", price: 1.25),
      ],
    ),

    // Sides
    Food(
      name: "French Fries",
      description:
          "Golden fries crispy on the outside and fluffy on the inside.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 3.99,
      catagory: FoodCatagory.sides,
      availableAddon: [
        Addon(name: "Chili Cheese", price: 2.00),
        Addon(name: "Truffle Oil", price: 1.75),
        Addon(name: "Garlic Parmesan", price: 1.50),
      ],
    ),
    Food(
      name: "Onion Rings",
      description:
          "Crispy battered onion rings served with a side of dipping sauce.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 4.49,
      catagory: FoodCatagory.sides,
      availableAddon: [
        Addon(name: "Chipotle Mayo", price: 0.75),
        Addon(name: "Sweet Chili Sauce", price: 0.50),
        Addon(name: "Ranch Dressing", price: 0.75),
      ],
    ),
    Food(
      name: "Mozzarella Sticks",
      description:
          "Golden and crispy on the outside, gooey and cheesy on the inside.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 5.99,
      catagory: FoodCatagory.sides,
      availableAddon: [
        Addon(name: "Marinara Sauce", price: 0.50),
        Addon(name: "Jalapeno Ranch", price: 0.75),
        Addon(name: "Honey Mustard", price: 0.75),
      ],
    ),
    Food(
      name: "Sweet Potato Fries",
      description:
          "Healthy alternative to regular fries, crispy and lightly seasoned.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 4.99,
      catagory: FoodCatagory.sides,
      availableAddon: [
        Addon(name: "Cinnamon Sugar", price: 1.00),
        Addon(name: "Maple Syrup", price: 0.75),
        Addon(name: "Chipotle Aioli", price: 0.75),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description:
          "Toasted bread rubbed with garlic and butter, perfect for sharing.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 3.49,
      catagory: FoodCatagory.sides,
      availableAddon: [
        Addon(name: "Mozzarella Cheese", price: 1.00),
        Addon(name: "Pesto Dip", price: 0.75),
        Addon(name: "Tomato Bruschetta", price: 0.50),
      ],
    ),

    // Drinks
    Food(
      name: "Coca-Cola",
      description: "Classic carbonated soft drink with a refreshing taste.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 1.99,
      catagory: FoodCatagory.drinks,
      availableAddon: [
        Addon(name: "Large Size", price: 0.50),
        Addon(name: "Ice Cubes", price: 0.25),
        Addon(name: "Lemon Wedge", price: 0.25),
      ],
    ),
    Food(
      name: "Lemonade",
      description: "Freshly squeezed lemon juice with a hint of sweetness.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 2.49,
      catagory: FoodCatagory.drinks,
      availableAddon: [
        Addon(name: "Mint Leaves", price: 0.50),
        Addon(name: "Raspberry Syrup", price: 0.75),
        Addon(name: "Strawberry Puree", price: 0.75),
      ],
    ),
    Food(
      name: "Iced Tea",
      description: "Chilled black tea served over ice with a slice of lemon.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 2.99,
      catagory: FoodCatagory.drinks,
      availableAddon: [
        Addon(name: "Peach Flavor", price: 0.75),
        Addon(name: "Mango Flavor", price: 0.75),
        Addon(name: "Passion Fruit Flavor", price: 0.75),
      ],
    ),
    Food(
      name: "Orange Juice",
      description: "Freshly squeezed orange juice packed with vitamin C.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 3.49,
      catagory: FoodCatagory.drinks,
      availableAddon: [
        Addon(name: "Pulp", price: 0.50),
        Addon(name: "Ginger Shot", price: 1.00),
        Addon(name: "Cranberry Mix", price: 0.75),
      ],
    ),
    Food(
      name: "Root Beer",
      description: "Fizzy and aromatic soda with a unique root beer flavor.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 2.29,
      catagory: FoodCatagory.drinks,
      availableAddon: [
        Addon(name: "Vanilla Ice Cream Float", price: 1.50),
        Addon(name: "Whipped Cream", price: 0.75),
        Addon(name: "Cherry Garnish", price: 0.50),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Brownie",
      description:
          "Rich and decadent chocolate brownie served warm with vanilla ice cream.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 5.99,
      catagory: FoodCatagory.dessert,
      availableAddon: [
        Addon(name: "Caramel Drizzle", price: 1.00),
        Addon(name: "Extra Ice Cream Scoop", price: 1.50),
        Addon(name: "Nuts", price: 0.75),
      ],
    ),
    Food(
      name: "New York Cheesecake",
      description:
          "Creamy cheesecake on a graham cracker crust, topped with your choice of fruit compote.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 6.99,
      catagory: FoodCatagory.dessert,
      availableAddon: [
        Addon(name: "Strawberry Compote", price: 1.25),
        Addon(name: "Blueberry Compote", price: 1.25),
        Addon(name: "Raspberry Compote", price: 1.25),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
          "Classic American dessert with a flaky crust and spiced apple filling.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 4.99,
      catagory: FoodCatagory.dessert,
      availableAddon: [
        Addon(name: "A la Mode", price: 1.50),
        Addon(name: "Caramel Sauce", price: 1.00),
        Addon(name: "Whipped Cream", price: 0.75),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 7.49,
      catagory: FoodCatagory.dessert,
      availableAddon: [
        Addon(name: "Chocolate Shavings", price: 1.25),
        Addon(name: "Kahlua Shot", price: 2.00),
        Addon(name: "Amaretto Shot", price: 2.00),
      ],
    ),
    Food(
      name: "Fruit Tart",
      description:
          "Buttery pastry crust filled with vanilla custard and topped with assorted fresh fruits.",
      imagePath: "lib/images/burgers/bacon_burger.png",
      price: 5.49,
      catagory: FoodCatagory.dessert,
      availableAddon: [
        Addon(name: "Chocolate Drizzle", price: 1.00),
        Addon(name: "Lemon Glaze", price: 0.75),
        Addon(name: "Apricot Jam", price: 0.50),
      ],
    ),
  ];

  /// getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cartItems;
  /**
   * Operations
   */
  
  final List<CartItem> _cartItems  = [];
  // add on cart
  // se here first you maintain a cart list 
  // when new add cart list request come you should 
  // check weather same product is in the cart or not
  void addTocart(Food food,List<Addon> selectedAddon){
    CartItem? cartItem = _cartItems.firstWhereOrNull((item){
      bool isSameFood = item.food==food;

      bool isSameAddon = ListEquality().equals(item.selectedAddon, selectedAddon);

      return isSameFood && isSameAddon;

    });

    if(cartItem != null){
           cartItem.quantity++;
    }else{
        _cartItems.add(CartItem(food: food, selectedAddon: selectedAddon));
      
    }

    notifyListeners();
  }
  //remove from cart

  void removeFromCart(CartItem cartItem){
    int indexOfItem = _cartItems.indexOf(cartItem);

    if(indexOfItem!= -1){
      if(_cartItems[indexOfItem].quantity>1){

        _cartItems[indexOfItem].quantity--;
      }else{
        _cartItems.removeAt(indexOfItem);
      }
    }
  notifyListeners();
  }
  // get total price of card 
  
  double getTotalPrice(){
    double total = 0.0;
    for(CartItem ctItems in _cartItems){
      total+= ctItems.totalPrice;
    }
    return total;
  }

  // number of item in the cart
   int getTotalItemCount(){
    int count =0;
    for(CartItem cartItem in _cartItems){
      count+= cartItem.quantity;
    }
    return count; 
   }

  // clear cart

  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }

  /**
   * helpers 
   */

  //generate receipt

  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }
  String _formateAddon(List<Addon> addons){
    return addons.map((e) => "${e.name} (${_formatPrice(e.price)})").join(', ');
  }

  String cartReceipDisplay(){
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();
    String formatedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    receipt.writeln(formatedDate);
    receipt.writeln();
    receipt.writeln('----------------');

    for(final cartItem in _cartItems){
      receipt.writeln("${cartItem.quantity} X ${cartItem.food.name}  - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddon.isNotEmpty){
        receipt.writeln('   Add-ons: ${ _formateAddon(cartItem.selectedAddon)}');
      }
      receipt.writeln();
    }

    receipt.writeln('------------');
    receipt.writeln();

    receipt.writeln('total items : ${getTotalItemCount()}');
    receipt.writeln('total price : ${_formatPrice(getTotalPrice())}');
    return receipt.toString();
  }

  //double to money

  // format the list of addon into bla bla

}
