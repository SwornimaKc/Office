import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_a_z/auth/auth_service.dart';
import 'package:shop_a_z/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';// indicates the login page of the app
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>(); 
    //two Text Controller
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    String _errMsg = '';
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            shrinkWrap:true,// height will be limited and listview will wrap its children
            children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email Address',
                    ),
                    validator:(value){
                      if(value == null || value.isEmpty){
                        return 'Provide a valid email address';
                  
                      }
                      return null;
                    } ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Password (at least 6 character)',
                    ),
                    validator:(value){
                      if(value == null || value.isEmpty){
                        return 'Provide a valid password';
                  
                      } 
                      return null;
                    } ,
                  ),
                ),
                ElevatedButton(
                  onPressed: _authenticate,
                 child: const Text('Login as Admin'),
                 ),
                 Text(_errMsg,style: const TextStyle(fontSize: 18, color: Colors.red),), 

            
            ]
            ),
            ),
            ),
      );
  
  }
  //disposing the controller

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
    if(_formKey.currentState!.validate()){
       EasyLoading.show(status:'Please Wait');
       final email = _emailController.text;
       final pass = _passwordController.text;
       try{
        final status = await  AuthService.loginAdmin(email, pass);
        EasyLoading.dismiss();
        //check the status of the user credential
        if(status){
               context.goNamed(DashboardPage.routeName);
        }else{
          await AuthService.logout();
          setState(() {
            _errMsg = 'This is not an Admin account';
          });
        }
   
       }on FirebaseAuthException catch(error){
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
       }
    }

  }
}
