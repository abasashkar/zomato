import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato/core/di/dependency_injection.dart';
import 'package:zomato/core/theme/app_theme.dart';
import 'package:zomato/features/auth/bloc/auth_bloc.dart';
import 'package:zomato/features/auth/bloc/auth_event.dart';
import 'package:zomato/features/splash/presentation/pages/splash_page.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => sl<AuthBloc>()..add(CheckAuthStatus()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const SplashPage(),
      ),
    );
  }
}