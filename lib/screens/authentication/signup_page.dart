import 'package:ecocoa/screens/authentication/login_page.dart';
import 'package:ecocoa/widgets/form_field.dart';
import 'package:ecocoa/widgets/pagesnavigator.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin:const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/signupimage.jpeg'),
                ),
              ),
              SizedBox(height: 50),
              const Text(
                "New Here?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text("Enter your credential to Register"),
              CustomFormField(
                buttonName: 'SignUp',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      nextNavReplacement(context, const LoginPage());
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}