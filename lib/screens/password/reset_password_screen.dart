
import 'package:flutter/material.dart';
import 'package:tmobile_app/screens/password/login_screen.dart';
import '../../colors/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen> {

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Reset Password"),
      ),

      body: Center(
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
                key: _formKey,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon(
                      Icons.lock_outline,
                      size: 80,
                      color: AppColors.primary,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Create New Password",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,

                      validator: (value) {

                        if (value == null ||
                            value.isEmpty) {
                          return "Enter password";
                        }

                        if (value.length < 6) {
                          return "Minimum 6 characters";
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        labelText: "New Password",

                        prefixIcon:
                            const Icon(Icons.lock),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller:
                          confirmPasswordController,
                      obscureText: true,

                      validator: (value) {

                        if (value !=
                            passwordController.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        labelText: "Confirm Password",

                        prefixIcon:
                            const Icon(Icons.lock),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primary,
                        ),

                        onPressed: () {

                          if (_formKey.currentState!
                              .validate()) {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Password Reset Successful"),
                                backgroundColor:
                                    Colors.green,
                              ),
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          }
                        },

                        child: const Text(
                          "Update Password",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
