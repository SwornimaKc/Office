
import 'package:flutter/material.dart';
import 'otp_screen.dart';
import '../../colors/app_colors.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final TextEditingController emailController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Forgot Password"),
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
                      Icons.lock_reset,
                      size: 80,
                      color: AppColors.primary,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Recover Your Password",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Enter your government email",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14,color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: emailController,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter email";
                        }

                        if (!value.contains("@")) {
                          return "Enter valid email";
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        labelText: "Government Email",

                        prefixIcon:
                            const Icon(Icons.email_outlined),

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

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),

                        onPressed: () {

                          if (_formKey.currentState!
                              .validate()) {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const OtpScreen(),
                              ),
                            );
                          }
                        },

                        child: const Text(
                          "Send OTP",
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
