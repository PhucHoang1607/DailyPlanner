import 'package:daily_planner/screen/main_screen_planner.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    final widthScreen = sizeScreen.width;
    final heightScreen = sizeScreen.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: heightScreen * 0.15),
        child: Center(
          child: Container(
            width: double.infinity,
            height: 500,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black26),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 200,
                  child: Lottie.asset(
                      'assets/animation/Animation - 1727165002975.json'),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.person_outline),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Enter the username'),
                          ),
                          controller: username,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.password),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Enter the password'),
                          ),
                          controller: password,
                          keyboardType: TextInputType.name,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (page) => MainScreenPlanner(),
                      ),
                    );
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
