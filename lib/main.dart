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
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
      ),
      home: const MainShell(),
    );
  }
}

class Work {
  String title;
  String desc;
  int words;
  Work(this.title, this.desc, this.words);
}

class VNote {
  String title;
  String desc;
  VNote(this.title, this.desc);
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final works = <Work>[
    Work('大周：从书院到工业革命', '主角穿越古代，用现代知识建立文明。', 126000),
    Work('九州文明设定集', '国家、科技树、人物、势力与时间线。', 32000),
  ];

  final settings = <VNote>[
    VNote('国家设定', '王朝制度、财政、军队、法律与改革阻力。'),
    VNote('人物档案', '主角、盟友、士族、工匠、商人、反派。'),
    VNote('科技树', '造纸、水力、冶铁、蒸汽、电气、铁路。'),
  ];

  final outlines = <String>[
    '第一章：穿越到县城书院',
    '第二章：用造纸术打开第一桶金',
    '第三章：建立水力工坊',
  ];

  final illustrations = <VNote>[
    VNote('主角站在古城高处', '蓝色晨光、古代城池、远处有水力工坊。'),
  ];

  void toast(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void addWork() {
    final title = TextEditingController();
    final desc = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('新建作品'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: title, decoration: const InputDecoration(labelText: '作品名称')),
            TextField(controller: desc, decoration: const InputDecoration(labelText: '一句话简介')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          FilledButton(
            onPressed: () {
              if (title.text.trim().isNotEmpty) {
                setState(() => works.add(Work(title.text.trim(), desc.text.trim(), 0)));
              }
              Navigator.pop(context);
              toast('作品已创建');
            },
            child: const Text('创建'),
          ),
        ],
      ),
    );
  }

  void addSetting() {
    final title = TextEditingController();
    final desc = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('添加设定'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: title, decoration: const InputDecoration(labelText: '设定名称')),
            TextField(controller: desc, decoration: const InputDecoration(labelText: '设定说明')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          FilledButton(
            onPressed: () {
              if (title.text.trim().isNotEmpty) {
                setState(() => settings.add(VNote(title.text.trim(), desc.text.trim())));
              }
              Navigator.pop(context);
              toast('设定已添加');
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  void addOutline() {
    final title = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('新增大纲节点'),
        content: TextField(controller: title, decoration: const InputDecoration(labelText: '剧情节点')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          FilledButton(
            onPressed: () {
              if (title.text.trim().isNotEmpty) {
                setState(() => outlines.add(title.text.trim()));
              }
              Navigator.pop(context);
              toast('大纲已添加');
            },
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  void addIllustration(String title, String desc) {
    setState(() => illustrations.add(VNote(title, desc)));
    toast('插图已保存到作品');
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(works: works, onAddWork: addWork, onOpenWriter: () => setState(() => index = 1)),
      WriterPage(onSave: () => toast('草稿已保存')),
      SettingsPage(settings: settings, onAdd: addSetting),
      OutlinePage(outlines: outlines, onAdd: addOutline),
      IllustrationPage(onSave: addIllustration, illustrations: illustrations),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '首页'),
          NavigationDestination(icon: Icon(Icons.edit_note_outlined), selectedIcon: Icon(Icons.edit_note), label: '写作'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: '设定'),
          NavigationDestination(icon: Icon(Icons.account_tree_outlined), selectedIcon: Icon(Icons.account_tree), label: '大纲'),
          NavigationDestination(icon: Icon(Icons.image_outlined), selectedIcon: Icon(Icons.image), label: '插图'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<Work> works;
  final VoidCallback onAddWork;
  final VoidCallback onOpenWriter;
  const DashboardPage({super.key, required this.works, required this.onAddWork, required this.onOpenWriter});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'V写作',
      subtitle: '网络小说与设定集创作平台',
      action: FilledButton.icon(onPressed: onAddWork, icon: const Icon(Icons.add), label: const Text('新建作品')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigHero(onOpenWriter: onOpenWriter),
          const SizedBox(height: 14),
          const Text('我的作品', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          for (final work in works)
            AppCard(
              onTap: onOpenWriter,
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 76,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF60A5FA), Color(0xFF1D4ED8)]),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.auto_stories, color: Colors.white),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(work.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 6),
                      Text(work.desc, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF64748B))),
                      const SizedBox(height: 6),
                      Text('${work.words} 字', style: const TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class BigHero extends StatelessWidget {
  final VoidCallback onOpenWriter;
  const BigHero({super.key, required this.onOpenWriter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1D4ED8)]),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Color(0x332563EB), blurRadius: 24, offset: Offset(0, 12))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('从一盏煤油灯开始\n建设现代文明', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, height: 1.2)),
        const SizedBox(height: 10),
        const Text('写小说、管设定、排大纲、做插图，一套系统完成。', style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 16),
        FilledButton.tonalIcon(onPressed: onOpenWriter, icon: const Icon(Icons.edit), label: const Text('继续写作')),
      ]),
    );
  }
}

class WriterPage extends StatefulWidget {
  final VoidCallback onSave;
  const WriterPage({super.key, required this.onSave});

  @override
  State<WriterPage> createState() => _WriterPageState();
}

class _WriterPageState extends State<WriterPage> {
  final controller = TextEditingController(text: '范家闻站在县城高处，望着远处仍靠煤油灯照明的街市。\n\n他知道，第一座水力工坊必须在三个月内建成。');

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: '写作编辑器',
      subtitle: '${controller.text.length} 字 · 自动保存模拟',
      action: FilledButton.icon(onPressed: widget.onSave, icon: const Icon(Icons.save), label: const Text('保存')),
      child: AppCard(
        child: TextField(
          controller: controller,
          onChanged: (_) => setState(() {}),
          maxLines: 22,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '开始创作你的小说……',
          ),
          style: const TextStyle(fontSize: 17, height: 1.65),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final List<VNote> settings;
  final VoidCallback onAdd;
  const SettingsPage({super.key, required this.settings, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: '设定集',
      subtitle: '人物、国家、势力、科技树、历史时间线',
      action: FilledButton.icon(onPressed: onAdd, icon: const Icon(Icons.add), label: const Text('添加设定')),
      child: Column(
        children: [
          for (final item in settings)
            AppCard(
              onTap: () => showInfo(context, item.title, item.desc),
              child: Row(
                children: [
                  const CircleAvatar(backgroundColor: Color(0xFFE0F2FE), child: Icon(Icons.book, color: Color(0xFF2563EB))),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(item.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(item.desc, style: const TextStyle(color: Color(0xFF64748B))),
                  ])),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class OutlinePage extends StatefulWidget {
  final List<String> outlines;
  final VoidCallback onAdd;
  const OutlinePage({super.key, required this.outlines, required this.onAdd});

  @override
  State<OutlinePage> createState() => _OutlinePageState();
}

class _OutlinePageState extends State<OutlinePage> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: '剧情大纲',
      subtitle: '卷、章、冲突、转折与高潮',
      action: FilledButton.icon(onPressed: widget.onAdd, icon: const Icon(Icons.add), label: const Text('新增')),
      child: AppCard(
        child: ExpansionTile(
          initiallyExpanded: expanded,
          onExpansionChanged: (v) => setState(() => expanded = v),
          leading: const Icon(Icons.account_tree, color: Color(0xFF2563EB)),
          title: const Text('第一卷：从书院到工业革命', style: TextStyle(fontWeight: FontWeight.w900)),
          children: [
            for (int i = 0; i < widget.outlines.length; i++)
              ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text(widget.outlines[i]),
                subtitle: const Text('点击可进入章节规划'),
                onTap: () => showInfo(context, '大纲节点', widget.outlines[i]),
              ),
          ],
        ),
      ),
    );
  }
}

class IllustrationPage extends StatefulWidget {
  final void Function(String title, String desc) onSave;
  final List<VNote> illustrations;
  const IllustrationPage({super.key, required this.onSave, required this.illustrations});

  @override
  State<IllustrationPage> createState() => _IllustrationPageState();
}

class _IllustrationPageState extends State<IllustrationPage> {
  final prompt = TextEditingController(text: '主角穿越古代，在蓝色晨光下建设第一座水力工坊');
  String style = '古风科技';
  bool generated = false;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: '插图功能',
      subtitle: '当前为插图 UI 原型，后续可接 AI 生图 API',
      action: FilledButton.icon(
        onPressed: () => setState(() => generated = true),
        icon: const Icon(Icons.auto_awesome),
        label: const Text('生成插图'),
      ),
      child: Column(
        children: [
          AppCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('插图提示词', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              const SizedBox(height: 10),
              TextField(
                controller: prompt,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '描述画面，例如：古代城池、现代文明、蓝色晨光、水力工坊……',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: style,
                decoration: InputDecoration(labelText: '插图风格', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                items: const [
                  DropdownMenuItem(value: '古风科技', child: Text('古风科技')),
                  DropdownMenuItem(value: '写实史诗', child: Text('写实史诗')),
                  DropdownMenuItem(value: '轻小说封面', child: Text('轻小说封面')),
                  DropdownMenuItem(value: '蓝色未来感', child: Text('蓝色未来感')),
                ],
                onChanged: (v) => setState(() => style = v ?? '古风科技'),
              ),
            ]),
          ),
          if (generated)
            AppCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF1E3A8A), Color(0xFF93C5FD)]),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, color: Colors.white, size: 72),
                  ),
                ),
                const SizedBox(height: 12),
                Text('模拟插图：$style', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                const SizedBox(height: 6),
                Text(prompt.text, style: const TextStyle(color: Color(0xFF64748B))),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(child: FilledButton.icon(onPressed: () => widget.onSave('模拟插图：$style', prompt.text), icon: const Icon(Icons.save), label: const Text('保存到作品'))),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(onPressed: () => setState(() => generated = false), icon: const Icon(Icons.refresh), label: const Text('重做')),
                ]),
              ]),
            ),
          const SizedBox(height: 8),
          const Align(alignment: Alignment.centerLeft, child: Text('已保存插图', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
          const SizedBox(height: 8),
          for (final item in widget.illustrations)
            AppCard(
              child: ListTile(
                leading: const Icon(Icons.image, color: Color(0xFF2563EB)),
                title: Text(item.title),
                subtitle: Text(item.desc),
              ),
            ),
        ],
      ),
    );
  }
}

class PageScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Widget? action;
  const PageScaffold({super.key, required this.title, required this.subtitle, required this.child, this.action});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF0F172A))),
              const SizedBox(height: 5),
              Text(subtitle, style: const TextStyle(color: Color(0xFF64748B))),
            ])),
            if (action != null) action!,
          ]),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const AppCard({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    final box = Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD8E8FF)),
        boxShadow: const [BoxShadow(color: Color(0x142563EB), blurRadius: 18, offset: Offset(0, 9))],
      ),
      child: child,
    );
    if (onTap == null) return box;
    return InkWell(borderRadius: BorderRadius.circular(24), onTap: onTap, child: box);
  }
}

void showInfo(BuildContext context, String title, String desc) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(desc),
      actions: [FilledButton(onPressed: () => Navigator.pop(context), child: const Text('知道了'))],
    ),
  );
}
