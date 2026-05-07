import 'package:flutter/material.dart';

void main() {
  runApp(const VWritingApp());
}

class VWritingApp extends StatelessWidget {
  const VWritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'V写作',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final pages = [
    const WelcomePage(),
    const WritingPage(),
    const SettingBookPage(),
    const OutlinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '写作',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '设定集',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: '大纲',
          ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1D4ED8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.auto_stories,
              color: Colors.white,
              size: 90,
            ),
            SizedBox(height: 20),
            Text(
              'V写作',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '网络小说与世界观创作平台',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WritingPage extends StatelessWidget {
  const WritingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('小说写作'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            hintText: '开始创作你的小说...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingBookPage extends StatelessWidget {
  const SettingBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      '国家设定',
      '人物档案',
      '势力组织',
      '历史时间线',
      '地图与城市',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('设定集'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}

class OutlinePage extends StatelessWidget {
  const OutlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('剧情大纲'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.looks_one),
            title: Text('第一章：穿越开始'),
          ),
          ListTile(
            leading: Icon(Icons.looks_two),
            title: Text('第二章：建立工业'),
          ),
          ListTile(
            leading: Icon(Icons.looks_3),
            title: Text('第三章：现代文明崛起'),
          ),
        ],
      ),
    );
  }
}
