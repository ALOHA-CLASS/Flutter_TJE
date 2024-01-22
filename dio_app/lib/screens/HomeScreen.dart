import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('테스트'),
            ElevatedButton(
              onPressed: () => {
                Navigator.pushReplacementNamed(context, '/test')
              }, 
              child: const Text('파일 업로드 테스트')
            )            
          ],
        ),
      ),
    );
  }
}