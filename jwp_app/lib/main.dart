import 'package:flutter/material.dart';
import 'package:jwp_app/provider/user_provider.dart';
import 'package:jwp_app/screens/home_screen.dart';
import 'package:jwp_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: const MyApp()
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT 토큰 로그인',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        '/login' : (context) => LoginScreen(),
      },
    );
  }
}

