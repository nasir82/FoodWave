import 'package:flutter/material.dart';
class MyLocation extends StatelessWidget {
const MyLocation({super.key});

void openSearchBox(BuildContext context){
  showDialog(context: context,
   builder: (contex)=>AlertDialog(

    title: const Text("Your Location"),
    content: const TextField(
      decoration: InputDecoration(
        hintText: "Search your location",
      ),
    ),
    actions: [
      MaterialButton(onPressed: (){
        Navigator.pop(context);
      },
      child: const Text("cancel"),),
      
      MaterialButton(onPressed: (){
        Navigator.pop(context);
      },
      child: const Text("Save"),),

    ],

   ));


}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Deliver now",style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),),
            GestureDetector(
              onTap: (){
                
               openSearchBox(context);
              },
              child: Row(
                children: [
                  Text("Sylhet 3100,Bangladesh",style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            )
          ],
        ),
    );
    
  }
}