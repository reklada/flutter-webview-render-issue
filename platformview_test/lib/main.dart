import 'package:flutter/material.dart';
import 'package:platformview_test/webview.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test app'),
        ),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text('TEST'),
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  20,
                  (index) => index % 2 == 0
                      ? const WebView()
                      : Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.red,
                        ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
