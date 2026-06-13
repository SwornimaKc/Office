import 'package:flutter/material.dart';
import 'screens/auth/splash_screen.dart';

void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'officer Assistance',
      theme: ThemeData(
       primaryColor:const Color(0xFF0D6FFF),
        
      scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      fontFamily:'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}


