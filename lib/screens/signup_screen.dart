import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:get/get.dart';

enum TypeOfForm { signIn, signUp }

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.put(AuthController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            ),
            width: 300,
            height: 450,
            child: Form(
              key: c.loginFormKey,
              child: Column(
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: "insert email",
                        labelText: "email"),
                    controller: c.emailController,
                    validator: (value) => c.validator(value!),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: "insert password",
                      labelText: "password",
                    ),
                    controller: c.passwordController,
                    validator: (value) => c.validator(value!),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: const Text(
                      "Do you already have an account? Sign In",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => {/** Goes to Sign In page (TBA) */},
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        c.signUp();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthController extends GetxController {
  final ApiService apiController = Get.put(ApiService());

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> signUp() async {
    bool? isValid = loginFormKey.currentState?.validate();
    if (isValid!) {
      var isDone = await apiController.signUp(
          emailController.text, passwordController.text);
      if (isDone) {
        // move to home page
      } else {
        // show errors
      }
    }
  }
}
