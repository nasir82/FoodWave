import 'package:flutter/material.dart';
import 'package:food_delevery_app/auth/auth_services.dart';
import 'package:food_delevery_app/components/my_button.dart';
import 'package:food_delevery_app/components/text_field.dart';
import 'package:food_delevery_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passControler = TextEditingController();

  // methods related to this pages will be here
  void login() async {
    if(emailControler.text.isEmpty || passControler.text.isEmpty){
       showDialog(
          context: context,
          builder: (context) =>const AlertDialog(
                title: Text("Fill the information"),
              ));
    }else{ 
    try {
      AuthServices authServices = AuthServices();
      await authServices.signInWithEmailandPassword(
          emailControler.text, passControler.text);
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.lock_open,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: emailControler, hintText: "Email", isObsecure: false),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: passControler,
              hintText: "Password",
              isObsecure: true),
          const SizedBox(
            height: 10,
          ),
          MyButton(
              onTap: () {
                login();
              },
              text: "login"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not yet SignUp?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                  )),
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
          )
        ]),
      ),
    );
  }
}
