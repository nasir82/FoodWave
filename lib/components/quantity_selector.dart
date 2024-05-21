import 'package:flutter/material.dart';
import 'package:food_delevery_app/models/food.dart';
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback increment;
  final VoidCallback decrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.increment,
    required this.decrement,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: decrement,
            child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 30,
              child: Text(quantity.toString(),textAlign: TextAlign.center,)),
          GestureDetector(
            onTap: increment,
            child: Icon(Icons.add),
            ),    
        ],
      ),
    );
  }
}