
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delevery_app/auth/auth_gate.dart';
import 'package:food_delevery_app/firebase_options.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:food_delevery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers:
    [

        ChangeNotifierProvider(create: (context) => ThemeProvieder()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvieder>(context).themeData,
      home:const AuthGate(),
    );
  }
}
