import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'V写作',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('V写作'),
        ),
        body: const Center(
          child: Text(
            'V写作 Android MVP',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
