import 'package:flutter/material.dart';
import 'password/login_screen.dart';
import '../colors/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });

    return Scaffold(
      body: Column(
        children: [ 
          Container(
            height: 12,
            color: AppColors.primary,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.notifications_active,
                    size: 100,
                    color: AppColors.primary,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Office Assistance",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}