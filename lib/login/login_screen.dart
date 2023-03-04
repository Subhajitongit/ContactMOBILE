// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tab_container/tab_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // final formKey = GlobalKey<FormState>();
    final loginPassController = TextEditingController();
    final loginEmailController = TextEditingController();
    final signupNameController = TextEditingController();
    final signupEmailController = TextEditingController();
    final signupPassController = TextEditingController();

    bool isLoading = false;

    Future<void> submitForm() async {
      // if (!formKey.currentState!.validate()) {
      //   return;
      // }

      setState(() {
        isLoading = true;
      });

      final url = Uri.parse('https://modern-newt-blazer.cyclic.app/user/login');
      final headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final body = jsonEncode(<String, String>{
        'email': loginEmailController.text,
        'password': loginPassController.text,
      });

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          // Handle successful response
          print('POST request successful!');
          print(response);
        } else {
          // Handle unsuccessful response
          print('POST request unsuccessful!');
        }
      } catch (e) {
        // Handle error
        print('Error: $e');
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Yellow Contact"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: TabContainer(
              color: Color.fromARGB(47, 0, 0, 0),
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: loginEmailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: loginPassController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: submitForm,
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text('Login'),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signupNameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signupEmailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signupPassController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ],
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                'Login',
                'Sign up',
              ],
            ),
          ),
        ),
      ),
    );
  }
}
