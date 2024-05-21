import 'package:flutter/material.dart';
import 'package:food_delevery_app/components/quantity_selector.dart';
import 'package:food_delevery_app/models/cart_item.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 155,
                            child: Text(
                              cartItem.food.name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                           
                        Text('\$${cartItem.food.price}'),
                      ],
                    ),
                    QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        increment: () {
                          restaurant.addTocart(
                              cartItem.food, cartItem.selectedAddon);
                        },
                        decrement: () {
                          restaurant.removeFromCart(cartItem);
                        })
                  ],
                ),
                SizedBox(
                  height: cartItem.selectedAddon.isEmpty ? 0 : 60,
                  
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                    children:
                        cartItem.selectedAddon.map((addon) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: FilterChip(
                              label: Row(
                                children: [
                                  //name
                                  Text(addon.name),
                                  Text(addon.price.toString()),
                                  //price
                                ],
                              ),
                              onSelected: (value) {},
                              ),
                        ),
                            ).toList(),
                  ),
                )
              ],
            )));
  }
}
