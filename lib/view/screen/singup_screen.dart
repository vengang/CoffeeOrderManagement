import 'package:coffeeapp/const/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF8F5),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.local_cafe, color: Appcolor.primary, size: 28),
                      SizedBox(width: 8),
                      Text(
                        "CoffeeGo",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Center(
                  child: Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "Start your journey with us today.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Appcolor.textSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 28),

                // Full Name
                Text(
                  "FULL NAME",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.textSecondary,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: _inputDecoration(
                    hintText: "Alex Mercer",
                    prefixIcon: Icons.person_outline_rounded,
                  ),
                ),
                SizedBox(height: 16),

                // Email Address
                Text(
                  "EMAIL ADDRESS",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.textSecondary,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    hintText: "hello@example.com",
                    prefixIcon: Icons.mail_outline_rounded,
                  ),
                ),
                SizedBox(height: 16),

                // Password
                Text(
                  "PASSWORD",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.textSecondary,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: isPasswordObscure,
                  decoration: _inputDecoration(
                    hintText: "••••••••",
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Appcolor.textSecondary,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordObscure = !isPasswordObscure;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 22),
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A2B19),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Divider OR
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.textSecondary,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                SizedBox(height: 24),

                // Google Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://nordichost.fi/wp-content/uploads/2025/02/HiView-Solutions-Google-Workspace-Reseller.-Super-G-Icon-min.png",
                          height: 22,
                          width: 22,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Sign up with Google",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Appcolor.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 28),

                // Navigate to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Appcolor.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Appcolor.textSecondary.withAlpha(150),
        fontSize: 14,
      ),
      prefixIcon: Icon(prefixIcon, color: Appcolor.textSecondary, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Appcolor.primary, width: 1.5),
      ),
    );
  }
}
