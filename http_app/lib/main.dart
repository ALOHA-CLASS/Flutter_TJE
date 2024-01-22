import 'package:flutter/material.dart';
import 'package:http_app/screens/board/list_screen.dart';
import 'package:http_app/screens/board/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'http 게시글 목록',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/test',
      routes: {
        '/test': (context) => TestScreen(),
        '/board/list': (context) => const ListScreen(),
        '/board/read': (context) => const ListScreen(),
        '/board/insert': (context) => const ListScreen(),
        '/board/update': (context) => const ListScreen(),
      },
      
    );
  }
}



