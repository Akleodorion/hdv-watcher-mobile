import 'package:flutter/material.dart';
import 'package:hdv_watcher/general_widgets/app_loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Things"),
        backgroundColor: Colors.black45,
      ),
      body: const AppLoadingPage(),
    );
  }
}
