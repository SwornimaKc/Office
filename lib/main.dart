import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmobile_app/auth/auth_service.dart';
import 'package:tmobile_app/screens/auth/login_screen.dart';
import 'package:tmobile_app/screens/officer_dashboard.dart';
import 'screens/auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget { 
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'officer Assistance',
      theme: ThemeData(
       primaryColor:const Color(0xFF0D6FFF),
        
      scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      fontFamily:'Roboto',
      ),
     routerConfig: _router,
    );
  }
  final _router = GoRouter(
    initialLocation: DashboardScreen.routeName,
    redirect: (context, state){
      if(AuthService.currentUser == null){
        return SplashScreen  .routeName;
      } return null;
    },
    routes: [
      GoRoute(
        name:DashboardScreen.routeName,
        path: DashboardScreen.routeName,
        builder: (context, state)=> const DashboardScreen(),
         ),
      GoRoute(
        name:SplashScreen.routeName,
        path: SplashScreen.routeName,
        builder: (context, state)=> const SplashScreen(),
         ),
      GoRoute(
        name:LoginScreen.routeName,
        path: LoginScreen.routeName,
        builder: (context, state)=> const LoginScreen(),
         ),
    ]);
}


 