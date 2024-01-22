import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Tab 1"),
                Tab(text: "Tab 2"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for Tab 1
                Center(
                  child: Text("This is content for Tab 1"),
                ),
                // Content for Tab 2
                Center(
                  child: Text("This is content for Tab 2"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
