import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato/core/components/primary_button.dart';
import 'package:zomato/core/theme/app_colours.dart';
import 'package:zomato/core/theme/app_text_style.dart';
import 'package:zomato/features/auth/bloc/auth_bloc.dart';
import 'package:zomato/features/auth/bloc/auth_event.dart';
import 'package:zomato/features/auth/bloc/auth_state.dart';
import 'package:zomato/features/auth/presentation/pages/signup_screen.dart';
import 'package:zomato/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:zomato/features/auth/presentation/widgets/social_button.dart';
import 'package:zomato/features/home/presentation/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final _formKey = GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();


  @override
  void dispose() {
      emailController.dispose();
      passwordController.dispose();
    super.dispose();
  }


void _login(){
   if (!_formKey.currentState!.validate()) return;
   context.read<AuthBloc>().add(LoginRequested(email: emailController.text.trim(), password: passwordController.text.trim()));
   
}
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
              child: BlocConsumer<AuthBloc,AuthState>(listener: (context, state) {
                    if (state is AuthSuccuess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    }
    if (state is AuthFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
              },
                 builder: (context,state){
                  return Form(key: _formKey,
                    
                    
                    child: Column(children: [
                     Container(
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
                
                       CustomTextField(
                        controller: emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                      SizedBox(height: 10,),
                          CustomTextField(
                        hintText: 'Password',
                        prefixIcon: Icons.password,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: true,
                      ),
                
                
                      const SizedBox(height: 24),
                
                    PrimaryButton(
          text: state is AuthLoading
              ? 'Loading...'
              : 'Create Account',
          onTap: state is AuthLoading
              ? null
              : _login,
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

                  ],));
                 }
              
              ),
            ),
          ),
        ),
      ),
    );
  }
}