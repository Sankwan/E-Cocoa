import 'package:ecocoa/screens/authentication/login_page.dart';
import 'package:ecocoa/screens/homepage.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "New Here?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text("Enter your credential to Register"),
              CustomFormField(
                onPressed: nextNav(context, const HomePage()),
                buttonName: 'SignUp',
              ),
              // TextButton(
              //   onPressed: () {
              //     nextNav(context, const ForgotPasswordPage());
              //   },
              //   child: const Text("Forgot password?"),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      nextNav(context, const LoginPage());
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