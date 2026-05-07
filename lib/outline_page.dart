import 'package:flutter/material.dart';

class OutlinePage extends StatelessWidget {
  const OutlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('大纲')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          OutlineItem(title: '第一卷 终末'),
          OutlineItem(title: '第二卷 风起长安'),
          OutlineItem(title: '第三卷 天下局'),
        ],
      ),
    );
  }
}

class OutlineItem extends StatelessWidget {
  final String title;

  const OutlineItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
