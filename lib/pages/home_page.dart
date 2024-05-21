import 'package:flutter/material.dart';
import 'package:food_delevery_app/components/my_description.dart';
import 'package:food_delevery_app/components/my_drawer.dart';
import 'package:food_delevery_app/components/my_food_tile.dart';
import 'package:food_delevery_app/components/my_location.dart';
import 'package:food_delevery_app/components/my_silver_appbar.dart';
import 'package:food_delevery_app/components/my_tapbar.dart';
import 'package:food_delevery_app/models/food.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:food_delevery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        TabController(length: FoodCatagory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  //sort out and return the list of food according to category
  List<Food> _filterMenuByCatagory(FoodCatagory catagory, List<Food> fullMenu) {
    return fullMenu.where((food) => food.catagory == catagory).toList();
  }

  List<Widget> getFoodInThisCatagory(List<Food> fullMenu) {
    return FoodCatagory.values.map((catagory) {
      List<Food> catagoryMenu = _filterMenuByCatagory(catagory, fullMenu);

      return ListView.builder(
        itemCount: catagoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = catagoryMenu[index];
          return MyFoodTile(food: food, onTap: ()=> Navigator.push(context,
           MaterialPageRoute(builder: (context)=> FoodPage(food: food))));
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySilverAppbar(
              // title is gonna be a colum
              title: Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.secondary,
                      indent: 20,
                      endIndent: 20,
                    ),

                    const MyLocation(),

                    // Divider(thickness: 1,color: Theme.of(context).colorScheme.primary,),
                    const MyDescription(),
                  ],
                ),
              ),
              //child gonna be tapbar
              child: MyTapbarr(
                controller: _controller,
              ),
            )
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _controller,
              children: getFoodInThisCatagory(restaurant.menu),
            ),
          ),
        ));
  }
}
