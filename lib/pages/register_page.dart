import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delevery_app/auth/auth_services.dart';
import 'package:food_delevery_app/components/my_button.dart';
import 'package:food_delevery_app/components/text_field.dart';
import 'package:food_delevery_app/pages/home_page.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  bool isFail = true;
  Exception? ex;

   registerUser(BuildContext context) async {
    if (passwordController.text.isEmpty ||
        confirmController.text.isEmpty ||
        emailController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Please fill all the information"),
              ));
    
    } else if (passwordController.text != confirmController.text) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("password don't match"),
              ));
     
    } else {
      AuthServices authService = AuthServices();
      try {
        await authService.createUserwithEmailAndPassword(
            emailController.text, passwordController.text);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10),
            MyTextField(
                controller: emailController,
                hintText: "Email",
                isObsecure: false),
            const SizedBox(height: 10),
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                isObsecure: true),
            const SizedBox(height: 10),
            MyTextField(
                controller: confirmController,
                hintText: "Confirm Password",
                isObsecure: true),
            const SizedBox(height: 10),
            MyButton(
              onTap: () async {
                // Add your registration logic here
                await registerUser(context);
              },
              text: "Register",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "  Register Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
