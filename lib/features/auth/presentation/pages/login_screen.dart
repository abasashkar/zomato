import 'package:flutter/material.dart';
import 'package:zomato/core/components/primary_button.dart';
import 'package:zomato/core/theme/app_colours.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';
import 'package:zomato/features/auth/presentation/pages/signup_screen.dart';
import 'package:zomato/features/auth/presentation/widgets/phone_input_field.dart';
import 'package:zomato/features/auth/presentation/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              Color(0xFFFF6B6B),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 450,
                ),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 25,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      '🍅',
                      style: TextStyle(fontSize: 70),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Welcome Back 👋',
                      style: AppTextStyles.authTitle,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Login to continue ordering delicious food',
                      style: AppTextStyles.authSubtitle,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 36),

                    const PhoneInputField(),

                    const SizedBox(height: 24),

                    PrimaryButton(
                      text: 'Send OTP',
                      height: 56,
                      width: double.infinity,
                      onTap: () {},
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Text('OR'),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [
                        Expanded(
                          child: SocialButton(
                            text: 'Google',
                            icon: Image.asset(
                              'assets/Google.png',
                              height: 22,
                            ),
                            onTap: () {},
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: SocialButton(
                            text: 'Facebook',
                            icon: Image.asset(
                              'assets/facebook.png',
                              height: 22,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          'New here?',
                          style: AppTextStyles.authSubtitle,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight:
                                  FontWeight.bold,
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
        ),
      ),
    );
  }
}