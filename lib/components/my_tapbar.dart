import 'package:flutter/material.dart';
import 'package:food_delevery_app/models/food.dart';

class MyTapbarr extends StatelessWidget {
  final TabController controller;
  const MyTapbarr({super.key, required this.controller});

  // make list of tab

  List<Tab> _buildCatagortTab(){
    return FoodCatagory.values.map((catagory) {

      return Tab(
        text: catagory.toString().split('.').last,);

    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //double totalWidth = MediaQuery.of(context).size.width * FoodCatagory.values.length;
    return DefaultTabController(
      length: FoodCatagory.values.length,
      child: SizedBox(
        width: double.infinity,
        child: TabBar(
          controller: controller,
          isScrollable: true, // Make TabBar scrollable
          tabs: _buildCatagortTab(),
          labelColor: Theme.of(context).colorScheme.inversePrimary,
          indicatorColor:Theme.of(context).colorScheme.secondary ,
        ),
      ),
    );
  }
}
