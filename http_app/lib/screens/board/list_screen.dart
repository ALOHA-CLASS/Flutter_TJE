
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_app/models/board.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/screens/board/read_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

///  ListView 에 게시글 목록 출력
///  - state : boardList
class _ListScreenState extends State<ListScreen> {

  List<Board> _boardList = [];

  @override
  void initState() {
    super.initState();
    getBoardList().then((result) {
      setState(() {
        _boardList = result;
      });
    });
    
  }

  Future<List<Board>> getBoardList() async {
    // 서버로 요청
    // var url = 'http://192.168.30.119:8080/board';
    var url = 'http://10.0.2.2:8080/board';

    // http.get( url, header )
    var response = await http.get(Uri.parse(url));
    // response : [ {"title" : '제목', "wrtier" : '작성자', "content" : '내용'}, ...]
    print('response.body :');
    print(response.body);

     
    print('boardList :');
    // UTF-8 디코딩
    var utf8Decoded = utf8.decode( response.bodyBytes );
    // JSON 디코딩
    var boardList = jsonDecode( utf8Decoded );
    List<Board> result = [];

    // print(boardList[0]['title']);

    for (var i = 0; i < boardList.length; i++) {
      result.add( Board(
                        boardNo: boardList[i]['boardNo'],
                        title: boardList[i]['title'],
                        writer: boardList[i]['writer'],
                        content: boardList[i]['content']) 
                );
    }

    print( result );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('게시글 목록')),
      body: Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: ListView.builder(
                itemCount: _boardList.length,
                itemBuilder: (context, index) {
                  return 
                    GestureDetector(
                      child: Card(
                              child: ListTile(
                                leading: Text( _boardList[index].boardNo.toString() ?? '0' ),
                                title: Text( _boardList[index].title ?? '제목없음'),
                                subtitle: Text( _boardList[index].writer ?? '-'),
                                trailing: Icon(Icons.more_vert),
                              ),
                            ),
                      onTap: () {
                        Navigator.push(context, 
                                      MaterialPageRoute(
                                          builder: (context) => ReadScreen(board: _boardList[index])
                                        ));
                      },
                    );
                }
              ),
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.create),
        )
    );
  }
}