import 'package:flutter/material.dart';
import 'package:tmobile_app/widgets/dashboard_background.dart';
import '../../constants/app_colors.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";

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
      backgroundColor: Colors.white,
      body: DashboardBackground(
        child: Column(
          children: [
            

            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      /// Municipality Logo
                      Image.asset(
                        "assets/images/logo.png", // Add municipality logo here
                        height: 120,
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "उदयपुरगढी गाउँपालिका",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Udayapurgadhi Rural Municipality",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 14, 72, 8),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Office Assistance System",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 5, 49, 13),
                        ),
                      ),

                      const SizedBox(height: 40),

                      CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
} 