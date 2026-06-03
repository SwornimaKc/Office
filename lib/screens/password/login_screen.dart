import 'package:flutter/material.dart';
import 'package:tmobile_app/screens/officer_dashboard.dart';
import '../../colors/app_colors.dart';
import 'forgot_password_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  //Demo login
  final String validUsername = "admin";
  final String validPassword ="password123";

  void login(){
    if(_formKey.currentState!.validate()){
     
      if(usernameController.text == validUsername && passwordController.text == validPassword){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful!")),
        );
        Navigator.push(context, MaterialPageRoute(builder: (_)=> const DashboardScreen(),),);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password"),
          backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints){
          return  SingleChildScrollView(
            child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight,),
            
          child: IntrinsicHeight(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key:_formKey,
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Icon(
                          Icons.account_balance,
                          size: 70,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Office Assistance",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
            
                        TextFormField(
                          controller: usernameController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please enter your username";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
            
                        const SizedBox(height: 16),
            
                      //Password
                        TextFormField(
                          controller: passwordController,
                          obscureText:obscurePassword,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please enter your password";
                            }
                            if(value.length < 6){
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        
                          decoration: InputDecoration(
                            labelText: "Password",
            
                            suffixIcon:  IconButton(
                              icon: Icon(
                                obscurePassword 
                              ?Icons.visibility_off 
                              :Icons.visibility
                              ),
                              onPressed: (){
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        ),
            
                        const SizedBox(height: 20),
            
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed:login,
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> ForgotPasswordScreen(), 
                          ),
                          );
                          },
                          child:const Text("Forgot password?"),
                            
                       )
                      ],
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
          );
        },
        ),
        
      ),
    );
  
  }
}
