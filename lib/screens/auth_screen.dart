import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          ),
          width: 300,
          height: 410,
          child: Form(
            key: c.loginFormKey,
            child: Column(
              children: [
                const Text(
                  "Sign In",
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
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      c.signIn();
                    },
                  ),
                )
              ],
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

  void signIn() {
    bool? isValid = loginFormKey.currentState?.validate();
    if (isValid!) {
      apiController.signUp(emailController.text, passwordController.text);
    }
  }
}
