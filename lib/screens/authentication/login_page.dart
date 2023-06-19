import 'package:ecocoa/screens/authentication/forgot_password.dart';
import 'package:ecocoa/screens/authentication/signup_page.dart';
import 'package:ecocoa/screens/homepage.dart';
import 'package:ecocoa/widgets/form_field.dart';
import 'package:ecocoa/widgets/pagesnavigator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key,}) : super(key: key);

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
                "Welcome Back",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text("Enter your credential to login"),
              // Username
              CustomFormField(
                onPressed: nextNav(context, const HomePage()),
                buttonName: 'Login',
              ),
              TextButton(
                onPressed: () {
                  nextNav(context, const ForgotPasswordPage());
                },
                child: const Text("Forgot password?"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      nextNav(context, const SignupPage());
                    },
                    child: const Text("Sign Up"),
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
