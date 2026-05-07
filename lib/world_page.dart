import 'package:flutter/material.dart';

class WorldPage extends StatelessWidget {
  const WorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('世界观')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          WorldCard(title: '世界设定'),
          WorldCard(title: '人物'),
          WorldCard(title: '势力'),
          WorldCard(title: '时间线'),
        ],
      ),
    );
  }
}

class WorldCard extends StatelessWidget {
  final String title;

  const WorldCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
