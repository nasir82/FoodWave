import 'package:flutter/material.dart';
import 'package:food_delevery_app/auth/auth_gate.dart';
import 'package:food_delevery_app/auth/auth_services.dart';
import 'package:food_delevery_app/components/drawer_tile.dart';
import 'package:food_delevery_app/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),
          MyDrawerTile(text: "Settings", 
          icon: Icons.settings,
           onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const MySettings()));
           }),
          MyDrawerTile(text: "About", icon: Icons.info, onTap: () {
           
          }),
          MyDrawerTile(text: "L O G O U T", icon: Icons.logout, onTap: () {
             AuthServices authServices = AuthServices();
            authServices.getSignOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const AuthGate()));
          }),
        ],
      ),
    );
  }
}
