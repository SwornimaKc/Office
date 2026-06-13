
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'reset_password_screen.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController otpController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("OTP Verification"),
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

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(
                    Icons.security,
                    size: 80,
                    color: AppColors.primary,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Enter OTP",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "OTP sent to your email",
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: "OTP",

                      prefixIcon:
                          const Icon(Icons.password),

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

                        if (otpController.text == "1234") {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const ResetPasswordScreen(),
                            ),
                          );

                        } else {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Invalid OTP"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },

                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text("Resend OTP"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
