import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delevery_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(food.name),
                          Text('\$${food.price}'),
                          const SizedBox(height: 10,width: double.infinity,),
                          Text(food.description)
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                      
                      food.imagePath,
                      height: 120,
                      fit: BoxFit.cover,
                    )),
                   
                  ],
                ),
            ),
             Divider(
                        thickness: .6,
                        indent: 20,
                        endIndent: 20,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
          ],
        ),
    );
    
  }
}
