
import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    // 데이터 가져오기  
    // String? data = ModalRoute.of(context)?.settings.arguments as String?;
    final tUser = ModalRoute.of(context)!.settings.arguments as User?;

    return Scaffold(
      appBar: AppBar(title: Text('마이 페이지')),
      body: Center(
        child: Text(
                  // '마이 페이지 : ${data}',
                  '마이 페이지 : ${tUser?.id}, ${tUser?.name}',
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
                Navigator.pushReplacementNamed(context, "/user");
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