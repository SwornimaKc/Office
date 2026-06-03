import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_a_z/auth/auth_service.dart';
import 'package:shop_a_z/pages/login_page.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/';// indicates the home page of the app
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(('Dashboard')),
        actions:[
          IconButton(onPressed: (){
              AuthService.logout().then((value)=> context.goNamed(LoginPage.routeName));
          
          }, 
          icon: const Icon(Icons.logout),
           ),
        ]
      ),
      body: Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}