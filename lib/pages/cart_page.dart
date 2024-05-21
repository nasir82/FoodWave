import 'package:flutter/material.dart';
import 'package:food_delevery_app/components/my_button.dart';
import 'package:food_delevery_app/components/my_cart_tile.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:food_delevery_app/pages/patment_page.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context,restaurent,child){
        //cart
        final userCart = restaurent.cart;
        //return scaffold
        return Scaffold(
          backgroundColor:Theme.of(context).colorScheme.background,
          appBar: AppBar(
            elevation: 2,
            title: Text("this is cart page"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){

                showDialog(context: context, builder: (context)=>AlertDialog(
                  title: Text("Are sure to delete carts?"),
                  actions: [
                    TextButton(onPressed: (){
                    
                    Navigator.pop(context);

                    }, child: Text("Cancel")),
                    TextButton(onPressed: (){

                      Navigator.pop(context);
                      restaurent.clearCart();
                    }, child: Text("Yes")),
                    
                  ],
                ));
              }, icon: Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  
                  children: [
                    userCart.isEmpty ? 
                   const Expanded(child: Center(child: Text("No carts available ")))
                   : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context,index)=> MyCartTile(cartItem: userCart[index]),
                        
                        ),
                    )
                  ],
                ),
              ),
              MyButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentPage()));
              }, text: "CheckOut Now"),
            const  SizedBox(height: 10,)
            ],
          ),
        );
      }
      );
  }
}

