import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          width: 300,
          height: 400,
          child: Form(
            child: Column(
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "insert email",
                      labelText: "email"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: "insert password",
                    labelText: "password",
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {},
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
