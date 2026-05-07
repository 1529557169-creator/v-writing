\
import 'package:flutter/material.dart';

void main() {
  runApp(const VWritingApp());
}

class VWritingApp extends StatelessWidget {
  const VWritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V写作',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F8FF),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    OutlinePage(),
    EditorPage(),
    WorldPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '首页'),
          NavigationDestination(icon: Icon(Icons.account_tree_outlined), selectedIcon: Icon(Icons.account_tree), label: '大纲'),
          NavigationDestination(icon: Icon(Icons.edit_note_outlined), selectedIcon: Icon(Icons.edit_note), label: '写作'),
          NavigationDestination(icon: Icon(Icons.public_outlined), selectedIcon: Icon(Icons.public), label: '设定'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF4FF), Color(0xFFBFD9FF), Color(0xFF2563EB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text('V写作', style: TextStyle(fontSize: 56, fontWeight: FontWeight.w900, color: Color(0xFF0B1B3D))),
              const SizedBox(height: 14),
              const Text('网络小说 & 设定集创作工具', style: TextStyle(fontSize: 18, color: Color(0xFF1E3A8A))),
              const SizedBox(height: 20),
              const Text('从一盏煤油灯开始，建设你的现代文明。', style: TextStyle(fontSize: 22, height: 1.45, fontWeight: FontWeight.w700, color: Color(0xFF102A56))),
              const SizedBox(height: 44),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AppShell())),
                  child: const Text('开始创作之旅', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: 'V写作',
      subtitle: '我的作品',
      child: Column(
        children: [
          HeroCard(),
          SizedBox(height: 16),
          WorkCard(title: '大周：从书院到工业革命', progress: '78%', words: '12.4万字'),
          WorkCard(title: '天启之城：我打造了现代帝国', progress: '45%', words: '8.7万字'),
          WorkCard(title: '九州风物志', progress: '设定集', words: '231个设定'),
        ],
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('从煤油灯开始\n建设你的盛世', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900, color: const Color(0xFF0B1B3D))),
          const SizedBox(height: 8),
          const Text('章节、大纲、人物、国家、科技树统一管理。'),
          const SizedBox(height: 16),
          FilledButton(onPressed: () {}, child: const Text('继续创作')),
        ],
      ),
    );
  }
}

class WorkCard extends StatelessWidget {
  final String title;
  final String progress;
  final String words;
  const WorkCard({super.key, required this.title, required this.progress, required this.words});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Container(width: 58, height: 76, decoration: BoxDecoration(color: const Color(0xFFD7E8FF), borderRadius: BorderRadius.circular(14)), child: const Icon(Icons.menu_book, color: Color(0xFF2563EB))),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 6),
            Text(words, style: const TextStyle(color: Color(0xFF64748B))),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress == '78%' ? .78 : progress == '45%' ? .45 : .15),
          ])),
          const SizedBox(width: 12),
          Text(progress, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
        ],
      ),
    );
  }
}

class OutlinePage extends StatelessWidget {
  const OutlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: '大纲',
      subtitle: '章节结构',
      child: Column(
        children: [
          SectionCard(title: '第一卷：砚田中的异客', items: ['穿越大周', '书院生活', '造纸术的秘密']),
          SectionCard(title: '第二卷：点燃文明的火种', items: ['改良农具', '水力磨坊', '治铁之法']),
        ],
      ),
    );
  }
}

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: '写作',
      subtitle: '正文编辑器',
      child: GlassCard(
        child: TextField(
          maxLines: 18,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '开始写下你的章节……\n\n例：范家闻站在县城高处，望着远处仍靠煤油灯照明的街市。他知道，第一座水力工坊必须在三个月内建成。',
            hintStyle: TextStyle(color: Colors.blueGrey.shade300, height: 1.6),
          ),
        ),
      ),
    );
  }
}

class WorldPage extends StatelessWidget {
  const WorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: '设定集',
      subtitle: '世界观管理',
      child: Column(
        children: [
          SettingTile(icon: Icons.person, title: '人物档案', desc: '主角、配角、敌人、盟友'),
          SettingTile(icon: Icons.account_balance, title: '国家势力', desc: '王朝、共和国、部落、商会'),
          SettingTile(icon: Icons.timeline, title: '历史年表', desc: '从穿越初期到工业时代'),
          SettingTile(icon: Icons.precision_manufacturing, title: '科技树', desc: '造纸、水力、冶铁、蒸汽、电气'),
          SettingTile(icon: Icons.map, title: '地理环境', desc: '省份、城市、资源、交通线'),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageFrame(
      title: '我的',
      subtitle: '创作统计',
      child: Column(
        children: [
          SettingTile(icon: Icons.bar_chart, title: '总字数', desc: '21.1万字'),
          SettingTile(icon: Icons.local_fire_department, title: '连续创作', desc: '7天'),
          SettingTile(icon: Icons.cloud_off, title: '本地模式', desc: '当前版本不需要服务器'),
        ],
      ),
    );
  }
}

class PageFrame extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  const PageFrame({super.key, required this.title, required this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        children: [
          Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF0B1B3D))),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(fontSize: 15, color: Color(0xFF64748B))),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final List<String> items;
  const SectionCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
        const SizedBox(height: 12),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(children: [const Icon(Icons.check_circle_outline, size: 18, color: Color(0xFF2563EB)), const SizedBox(width: 10), Text(item)]),
          ),
      ]),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const SettingTile({super.key, required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          CircleAvatar(backgroundColor: const Color(0xFFEAF4FF), child: Icon(icon, color: const Color(0xFF2563EB))),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(desc, style: const TextStyle(color: Color(0xFF64748B))),
          ])),
          const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD8E8FF)),
        boxShadow: const [BoxShadow(color: Color(0x1A2563EB), blurRadius: 20, offset: Offset(0, 10))],
      ),
      child: child,
    );
  }
}
