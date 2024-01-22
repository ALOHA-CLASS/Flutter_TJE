import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  void initState() {
    super.initState();
    _getPermission();
  }

  File? _selectedFile; 
  TextEditingController _titleController = TextEditingController();
  TextEditingController _writerController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  
  Future<void> _getPermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      // 권한이 이미 허용된 경우
      // proceedWithFileOperation(); // 파일 작업 진행
      print('이미 권한 승인됨...');
    } else {
      // 권한을 요청
      var permission = await Permission.storage.request();
      if (permission.isGranted) {
        // 권한이 허용된 경우
        // proceedWithFileOperation(); // 파일 작업 진행
        print('이미 권한 승인됨...');
      } else {
        // 권한이 거부된 경우
        // _handlePermissionDenied();
        print('이미 권한 승인됨...');
      }
    }
  }

  Future<void> _pickFile() async {

    // bool check = await _getPermission();

    // if( !check ) {
    //   return;
    // }

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      return;
    }

    var uri = Uri.parse('http://10.0.2.2:8080/board'); // 업로드할 서버의 URL
    var request = http.MultipartRequest('POST', uri);

    // 파일을 추가
    var fileField = await http.MultipartFile.fromPath('files', _selectedFile!.path);
    request.files.add(fileField);

    // 텍스트 데이터 추가
    request.fields['title'] = _titleController.text;
    request.fields['writer'] = _writerController.text;
    request.fields['content'] = _contentController.text;

    try {
      // 업로드 요청 보내기
      var response = await request.send();

      // 응답 확인
      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('File upload failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading file: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload Example'),
      ),
      body: SingleChildScrollView(
        child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: _writerController,
                        decoration: InputDecoration(labelText: 'Writer'),
                      ),
                      TextField(
                        controller: _contentController,
                        decoration: InputDecoration(labelText: 'Content'),
                      ),
                      SizedBox(height: 20),
                      _selectedFile != null
                          ? Text('Selected File: ${_selectedFile!.path}')
                          : Text('No file selected'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _pickFile,
                        child: Text('파일 선택'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _uploadFile,
                        child: Text('등록하기'),
                      ),
                    ],
                  ),
                ),
      )
      
     
    );
  }
}