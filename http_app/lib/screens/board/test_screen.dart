
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_app/models/board.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Future<String> fetchData() async {
    // Simulate asynchronous data fetching
    await Future.delayed(Duration(seconds: 2));
    return "Data from server";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder and TabBarView Example"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 200,
              child: Text('Test'),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                tabs: [
                  Tab(text: "Tab 1"),
                  Tab(text: "Tab 2"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // Content for Tab 1
                  ListView.builder(
                    itemCount: 50, // 예시로 아이템 50개
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Item $index"),
                      );
                    },
                  ),
                  // Content for Tab 2
                  ListView.builder(
                    itemCount: 50, // 예시로 아이템 50개
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Item $index"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } // build 끝


  // Simulating fetching data from the server
  Future<String> fetchDataFromServer() async {

    Board board = await getBoard();
    print(board.content);
    
    // return "Data from server: $serverData";
    return board.content ?? 'No Data';
  }


  // ---------------------- 💻 데이터 ----------------------
  Future<Board> getBoard() async {
    // 서버로 요청
    var url = 'http://10.0.2.2:8080/board/247';

    // http.get( url, header )
    var response = await http.get(Uri.parse(url));

    if( response.statusCode != 200 ) {
      throw Exception('데이터 응답 실패...');
    }

    print('response.body :');
    print(response.body);
     
    // UTF-8 디코딩
    var utf8Decoded = utf8.decode( response.bodyBytes );
    // JSON 디코딩
    var board = jsonDecode( utf8Decoded );
    

    // print(boardList[0]['title']);
    Board result = Board(
          boardNo: board['boardNo'],
          title: board['title'],
          writer: board['writer'],
          content: board['content']
    );

    print( result );
    return result;
  }
}