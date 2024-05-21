import 'package:flutter/material.dart';
import 'package:food_delevery_app/components/my_button.dart';
import 'package:food_delevery_app/models/food.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons = {};
   FoodPage({super.key, required this.food}){

    for(Addon addon in food.availableAddon){
      selectedAddons[addon] = false;
    }
   }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(){

    List<Addon> addons = [];
    for(Addon addon in widget.food.availableAddon){
      if(widget.selectedAddons[addon]==true){
          addons.add(addon);
      }
    }
    context.read<Restaurant>().addTocart(widget.food, addons);  
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [  Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            
            children: [
              Image.asset(
                widget.food.imagePath,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.food.name),
                    Text(widget.food.price.toString()),
                    Text(widget.food.description),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(color: Theme.of(context).colorScheme.primary,),
                    ),
                 const   Text("Available Addon "),
                 const SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.availableAddon.length,
                        itemBuilder: (context, index) {
                          Addon addon = widget.food.availableAddon[index];
                          return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text(addon.price.toString()),
                            checkColor: Colors.green,
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                   
                  ],
                ),
              ),
               Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: MyButton(onTap: ()=> addToCart(), text: "Add on cart"),
                    )
            ],
          ),
        ),
      ),
      SafeArea(
        child: Opacity(
          opacity: .5,
          child: Container(
            
            
            decoration: BoxDecoration(
              
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary),
              child: Material(child: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back),)),
            
          ),
        ),
      ),

      ]
    );
  }
}
