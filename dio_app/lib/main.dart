import 'package:dio_app/screens/HomeScreen.dart';
import 'package:dio_app/screens/test.dart';
import 'package:dio_app/screens/board/BoardInsertScreen.dart';
import 'package:dio_app/screens/board/BoardListScreen.dart';
import 'package:dio_app/screens/board/BoardReadScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dio 라이브러리',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/test': (context) => TestScreen(),
        '/board/list': (context) => BoardListScreen(),
        '/board/read': (context) => BoardReadScreen(),
        '/board/insert': (context) => BoardInsertScreen(),
      },
    );
  }
}
