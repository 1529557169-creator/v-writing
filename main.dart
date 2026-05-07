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
      theme: VTheme.light,
      home: const WelcomePage(),
    );
  }
}

class VTheme {
  static const Color primary = Color(0xFF2563EB);
  static const Color deepBlue = Color(0xFF0F2A5F);
  static const Color sky = Color(0xFFEAF3FF);
  static const Color ink = Color(0xFF102033);
  static const Color muted = Color(0xFF6B7A90);
  static const Color card = Color(0xFFFFFFFF);
  static const Color line = Color(0xFFE2EAF5);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF6FAFF),
      fontFamily: 'sans',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF6FAFF),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: ink,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        iconTheme: IconThemeData(color: ink),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: muted,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}

class Work {
  final String title;
  final String subtitle;
  final int words;
  final double progress;
  final IconData icon;

  const Work({
    required this.title,
    required this.subtitle,
    required this.words,
    required this.progress,
    required this.icon,
  });
}

const demoWorks = [
  Work(
    title: '大周：从书院到工业革命',
    subtitle: '更新至第56章 · 蒸汽与齿轮',
    words: 124000,
    progress: 0.78,
    icon: Icons.auto_stories,
  ),
  Work(
    title: '天启之城：我打造了现代帝国',
    subtitle: '更新至第32章 · 电灯初明',
    words: 87000,
    progress: 0.45,
    icon: Icons.castle,
  ),
  Work(
    title: '九州风物志',
    subtitle: '设定集 · 23个设定',
    words: 24000,
    progress: 0.24,
    icon: Icons.public,
  ),
];

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF5FF), Color(0xFFF7FBFF), Color(0xFFDDEBFF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Center(
                  child: Text(
                    'V写作',
                    style: TextStyle(
                      fontSize: 58,
                      height: 1,
                      fontWeight: FontWeight.w900,
                      color: VTheme.deepBlue,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    '网络小说 & 设定集创作工具',
                    style: TextStyle(color: VTheme.muted, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 40),
                const HeroPanel(),
                const Spacer(),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: VTheme.primary,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainShell()),
                    );
                  },
                  child: const Text('开始创作之旅', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 14),
                TextButton(onPressed: () {}, child: const Text('登录 / 注册')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeroPanel extends StatelessWidget {
  const HeroPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFBFDFFF), Color(0xFFEEF7FF)],
        ),
        boxShadow: [
          BoxShadow(color: VTheme.primary.withOpacity(.12), blurRadius: 40, offset: const Offset(0, 18)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 8,
            child: Icon(Icons.castle, size: 86, color: VTheme.primary.withOpacity(.18)),
          ),
          Positioned(
            left: 6,
            bottom: 2,
            child: Icon(Icons.precision_manufacturing, size: 84, color: VTheme.deepBlue.withOpacity(.18)),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('从一盏煤油灯开始', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: VTheme.deepBlue)),
              SizedBox(height: 8),
              Text('建设你的盛世文明', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: VTheme.deepBlue)),
              SizedBox(height: 18),
              Text('管理章节、大纲、人物、国家、科技树与历史时间线。', style: TextStyle(color: VTheme.muted, height: 1.5)),
            ],
          ),
        ],
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    OutlinePage(),
    EditorPage(),
    CodexPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.schema_rounded), label: '大纲'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_rounded), label: '写作'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_special_rounded), label: '资料'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: '我的'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('V写作'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.workspace_premium_outlined)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
        children: [
          const FeatureBanner(),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sectionTitle('快捷入口'),
              TextButton(onPressed: () {}, child: const Text('全部')),
            ],
          ),
          const QuickGrid(),
          const SizedBox(height: 18),
          sectionTitle('我的作品'),
          const SizedBox(height: 10),
          ...demoWorks.map((work) => WorkCard(work: work)),
        ],
      ),
    );
  }
}

Widget sectionTitle(String text) => Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: VTheme.ink));

class FeatureBanner extends StatelessWidget {
  const FeatureBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(colors: [Color(0xFFD9ECFF), Color(0xFFFFFFFF)]),
        border: Border.all(color: VTheme.line),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('从书院到工业革命', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: VTheme.deepBlue)),
                const SizedBox(height: 8),
                const Text('为穿越古代、发展现代文明题材打造的创作工作台。', style: TextStyle(color: VTheme.muted, height: 1.4)),
                const SizedBox(height: 14),
                FilledButton(onPressed: () {}, child: const Text('继续创作')),
              ],
            ),
          ),
          const Icon(Icons.auto_fix_high_rounded, size: 70, color: VTheme.primary),
        ],
      ),
    );
  }
}

class QuickGrid extends StatelessWidget {
  const QuickGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('新建作品', Icons.note_add_outlined),
      ('大纲模板', Icons.account_tree_outlined),
      ('设定集', Icons.book_outlined),
      ('灵感库', Icons.lightbulb_outline),
      ('数据统计', Icons.bar_chart_rounded),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((item) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              children: [
                Container(
                  height: 52,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: VTheme.line)),
                  child: Icon(item.$2, color: VTheme.primary),
                ),
                const SizedBox(height: 8),
                Text(item.$1, style: const TextStyle(fontSize: 12, color: VTheme.ink), textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class WorkCard extends StatelessWidget {
  final Work work;
  const WorkCard({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => WorkDetailPage(work: work))),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(colors: [Color(0xFF1D4ED8), Color(0xFF93C5FD)]),
                ),
                child: Icon(work.icon, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(work.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: VTheme.ink)),
                    const SizedBox(height: 6),
                    Text(work.subtitle, style: const TextStyle(color: VTheme.muted, fontSize: 12)),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(value: work.progress, minHeight: 6, borderRadius: BorderRadius.circular(20)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text('${(work.progress * 100).round()}%', style: const TextStyle(color: VTheme.muted, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkDetailPage extends StatelessWidget {
  final Work work;
  const WorkDetailPage({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(work.title), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))]),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          StatPanel(work: work),
          const SizedBox(height: 18),
          sectionTitle('章节'),
          const SizedBox(height: 10),
          ...['第1章 穿越大周', '第2章 书院生活', '第3章 造纸术的秘密', '第4章 改良农具', '第5章 水力磨坊'].map((e) => ChapterTile(title: e)),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}

class StatPanel extends StatelessWidget {
  final Work work;
  const StatPanel({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: VTheme.line)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          stat('字数', '${(work.words / 10000).toStringAsFixed(1)}万'),
          stat('章节', '56'),
          stat('完成度', '${(work.progress * 100).round()}%'),
        ],
      ),
    );
  }
}

Widget stat(String label, String value) => Column(children: [Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: VTheme.primary)), const SizedBox(height: 6), Text(label, style: const TextStyle(color: VTheme.muted))]);

class ChapterTile extends StatelessWidget {
  final String title;
  const ChapterTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: const Text('已写 · 3200字'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class OutlinePage extends StatelessWidget {
  const OutlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arcs = {
      '第一卷：砚田中的异客': ['穿越大周', '书院生活', '造纸术的秘密'],
      '第二卷：点燃文明的火种': ['改良农具', '水力磨坊', '治铁之法'],
      '第三卷：蒸汽与秩序': ['城市工坊', '商会政治', '新军雏形'],
    };
    return Scaffold(
      appBar: AppBar(title: const Text('大纲'), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))]),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: arcs.entries.map((entry) {
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.key, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: VTheme.deepBlue)),
                  const SizedBox(height: 10),
                  ...entry.value.asMap().entries.map((e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(radius: 14, backgroundColor: VTheme.sky, child: Text('${e.key + 1}', style: const TextStyle(fontSize: 12, color: VTheme.primary))),
                        title: Text(e.value),
                        trailing: const Text('已写', style: TextStyle(color: VTheme.muted)),
                      )),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('写作'), actions: [TextButton(onPressed: () {}, child: const Text('保存'))]),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '章节标题',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: '在这里写下你的故事……\n\n例如：他站在书院的旧窗前，看见远处的水车第一次转动。',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('字数：0', style: TextStyle(color: VTheme.muted)),
                Text('自动保存：本地草稿', style: TextStyle(color: VTheme.muted)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CodexPage extends StatelessWidget {
  const CodexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('人物档案', '主角、配角、反派、人物弧光', Icons.people_alt_outlined),
      ('国家势力', '王朝、贵族、商会、工会、军队', Icons.flag_outlined),
      ('历史年表', '从蒙昧时代到信息时代', Icons.timeline),
      ('科技树', '造纸、冶铁、蒸汽、电气、通信', Icons.account_tree_outlined),
      ('地理环境', '城市、河流、矿区、交通线', Icons.map_outlined),
      ('文化风俗', '宗教、礼法、教育、阶层秩序', Icons.temple_buddhist_outlined),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('设定集')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: VTheme.line)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('世界概览', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: VTheme.deepBlue)),
                SizedBox(height: 8),
                Text('一个类似古代中国王朝的世界，主角穿越后，以知识、制度与生产力推动文明发展。', style: TextStyle(color: VTheme.muted, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          ...items.map((item) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(color: VTheme.sky, borderRadius: BorderRadius.circular(14)),
                    child: Icon(item.$3, color: VTheme.primary),
                  ),
                  title: Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w800)),
                  subtitle: Text(item.$2),
                  trailing: const Icon(Icons.chevron_right),
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(color: VTheme.primary, borderRadius: BorderRadius.circular(22)),
                    child: const Center(child: Text('V', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900))),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('创作者', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                      SizedBox(height: 4),
                      Text('本地写作空间', style: TextStyle(color: VTheme.muted)),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const SettingsTile(icon: Icons.cloud_off_outlined, title: '离线模式', subtitle: '当前为纯本地存储原型'),
          const SettingsTile(icon: Icons.palette_outlined, title: '主题外观', subtitle: '蓝色 / 古典科技风'),
          const SettingsTile(icon: Icons.security_outlined, title: '数据安全', subtitle: '后续可增加导出与备份'),
          const SettingsTile(icon: Icons.smart_toy_outlined, title: 'AI辅助', subtitle: '后续接入续写、润色、设定推演'),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const SettingsTile({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: VTheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
