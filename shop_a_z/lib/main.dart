import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_a_z/auth/auth_service.dart';
import 'package:shop_a_z/pages/dashboard_page.dart';
import 'package:shop_a_z/pages/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     routerConfig: _router,
    );
  }
  final _router = GoRouter(
    
   initialLocation: DashboardPage.routeName,

   redirect: (context,state){// redirect argument  ley chai currentUser ko status check garxaa like previously logged in gareko xa ki xaina bhanera

    if(AuthService.currentUser == null){
      return LoginPage.routeName; 
    }
    return null; // it will not redirect if currentUSer is not null.
   }, 
    routes:[
      GoRoute(
        name: DashboardPage.routeName,
        path: DashboardPage.routeName,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routeName,
        builder:(context, state) => const LoginPage(),
      ),
    ]
    );
    
}
