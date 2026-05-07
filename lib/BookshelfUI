import 'package:flutter/material.dart';

class BookshelfPage extends StatelessWidget {
  const BookshelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      {
        "title": "长夜余火",
        "chapter": "更新至 第128章",
        "image":
            "https://images.unsplash.com/photo-1512820790803-83ca734da794"
      },
      {
        "title": "云佳梦共和国",
        "chapter": "更新至 第42章",
        "image":
            "https://images.unsplash.com/photo-1507842217343-583bb7270b66"
      },
      {
        "title": "永夜边境",
        "chapter": "更新至 第87章",
        "image":
            "https://images.unsplash.com/photo-1495446815901-a7297e633e8d"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部栏
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "V写作",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1D2740),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "继续你的世界",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Color(0xff1D2740),
                    ),
                  )
                ],
              ),
            ),

            // 今日创作卡片
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff243B6B),
                      Color(0xff1D2740),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.auto_stories,
                      color: Colors.white,
                      size: 42,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "今日已创作 4,280 字",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "连续创作 12 天",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // 最近创作
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "最近创作",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1D2740),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("查看全部"),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 小说列表
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          // 封面
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(18),
                            child: Image.network(
                              book["image"]!,
                              width: 80,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 16),

                          // 信息
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book["title"]!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                        FontWeight.bold,
                                    color:
                                        Color(0xff1D2740),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  book["chapter"]!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Row(
                                  children: [
                                    ElevatedButton(
                                      style:
                                          ElevatedButton
                                              .styleFrom(
                                        backgroundColor:
                                            const Color(
                                                0xff243B6B),
                                        shape:
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius
                                                  .circular(
                                                      14),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "继续创作",
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Container(
                                      padding:
                                          const EdgeInsets
                                              .all(10),
                                      decoration:
                                          BoxDecoration(
                                        color:
                                            const Color(
                                                0xffEEF3FF),
                                        borderRadius:
                                            BorderRadius
                                                .circular(
                                                    12),
                                      ),
                                      child: const Icon(
                                        Icons.more_horiz,
                                        color:
                                            Color(0xff243B6B),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 底部导航
            Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                  )
                ],
              ),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  BottomItem(
                    icon: Icons.library_books,
                    label: "书架",
                    active: true,
                  ),
                  BottomItem(
                    icon: Icons.edit_note,
                    label: "创作",
                  ),
                  BottomItem(
                    icon: Icons.auto_awesome,
                    label: "AI",
                  ),
                  BottomItem(
                    icon: Icons.person,
                    label: "我的",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const BottomItem({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active
              ? const Color(0xff243B6B)
              : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: active
                ? const Color(0xff243B6B)
                : Colors.grey,
            fontWeight:
                active ? FontWeight.bold : FontWeight.normal,
          ),
        )
      ],
    );
  }
}
