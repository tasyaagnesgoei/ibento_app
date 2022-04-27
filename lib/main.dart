import 'package:flutter/material.dart';
import 'package:ibento_app/pages/splash_screen.dart';
import 'package:ibento_app/providers/auth_provider.dart';
import 'package:ibento_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(IbentoApp());

class IbentoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
