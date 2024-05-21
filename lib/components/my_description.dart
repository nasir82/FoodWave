import 'package:flutter/material.dart';
class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(10),
      ),
      child:const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("\$0.99"),
              Text("Delivery Fee")
            ],
          ),
          Column(
            children: [
              Text("20-25 Mins"),
              Text("Delivery Time")
            ],
          ),
          
        ],
      ),
    );
  }
}