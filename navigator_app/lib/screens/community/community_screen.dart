
import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 데이터 가져오기
    String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text('커뮤니티')),
      body: Center(
        child: Text(
                  '커뮤니티 : $data ',
                  style: TextStyle(fontSize: 30.0),
              )
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, "/user");
                // Navigator.pushReplacementNamed(context, "/user");
                Navigator.pushReplacementNamed(context, "/user", arguments: User(id: 'joeun', name: '김조은',));
              }, 
              child: Text('마이 페이지')
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, "/community");
                Navigator.pushReplacementNamed(context, "/community");
              }, 
              child: Text('커뮤니티')
            ),
          ],
        ),
      ),
    );
  }
}