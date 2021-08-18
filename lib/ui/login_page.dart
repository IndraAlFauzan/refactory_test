import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:refactory_test/constant.dart';
import 'package:refactory_test/widget/textform.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 6,
              ),
              const Text(
                'Hey There,',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Text(
                'Wellcome Back.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextForm(
                  hint: 'Enter your email',
                  cr: email,
                  icon: const Icon(Icons.email)),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextFormPass(
                hint: 'Enter your Password',
                cr: password,
                icon: const Icon(Icons.lock),
                benar: true,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.rounded_corner),
                    label: const Text("Login with Google"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
