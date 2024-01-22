
import 'package:flutter/material.dart';
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
                children: [
                  // Content for Tab 1
                  FutureBuilder<String>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else {
                        return Center(child: Text(snapshot.data ?? ""));
                      }
                    },
                  ),
                  // Content for Tab 2
                  FutureBuilder<String>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else {
                        return Center(child: Text(snapshot.data ?? ""));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}