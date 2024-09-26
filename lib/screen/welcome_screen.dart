import 'package:daily_planner/screen/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 180,
              child: Image.asset('assets/images/ToDo.png'),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome to Daily Planner',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (page) => LoginScreen(),
                  ),
                );
              },
              child: const Text('Let\'s Begin'),
            )
          ],
        ),
      ),
    );
  }
}
