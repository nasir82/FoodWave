import 'package:flutter/material.dart';
import 'package:food_delevery_app/auth/firestore_service.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class DeliveryProgress extends StatefulWidget {
  const DeliveryProgress({super.key});

  @override
  State<DeliveryProgress> createState() => _DeliveryProgressState();
}

class _DeliveryProgressState extends State<DeliveryProgress> {
  FirestoreServices db = FirestoreServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String receipt = context.read<Restaurant>().cartReceipDisplay();
    db.saveOnDatabase(receipt);
    db.getUpdate();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress.."),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              "Thank your for your order",
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Consumer<Restaurant>(
                    builder: (context, restaurant, child) =>
                        Text(restaurant.cartReceipDisplay()))),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Estimated delivery time 4 PM",
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext contex) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon:const Icon(Icons.person),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 10,),
            //Driver details
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Kaua Kader Mia ",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Text("Driver"),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
