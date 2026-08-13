import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/view/parentScreen.dart';
import 'package:coffeeapp/view/screen/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordObscure = true;

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
                SizedBox(height: 36),
                Center(
                  child: Text(
                    "Welcome back",
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
                    "Sign in to continue your ritual.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Appcolor.textSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 32),
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
                  decoration: InputDecoration(
                    hintText: "hello@example.com",
                    hintStyle: TextStyle(
                      color: Appcolor.textSecondary.withAlpha(150),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline_rounded,
                      color: Appcolor.textSecondary,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: Appcolor.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    hintStyle: TextStyle(
                      color: Appcolor.textSecondary.withAlpha(150),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Appcolor.textSecondary,
                      size: 20,
                    ),
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
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(
                        color: Appcolor.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Appcolor.textSecondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28),
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
                        TextButton.icon(
                          onPressed: () {
                            Get.to(() => Parentscreen());
                          },
                          iconAlignment:
                              IconAlignment.end, // Places icon after the text
                          label: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
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
                          "Continue with Google",
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
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Appcolor.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: Text(
                        "Sign Up",
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
}
