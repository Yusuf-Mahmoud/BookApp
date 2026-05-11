import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Items App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

// ─── Data Model ───────────────────────────────────────────────
class Item {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String category;
  final String date;
  final IconData icon;
  final Color color;

  const Item({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.date,
    required this.icon,
    required this.color,
  });
}

final List<Item> kItems = [
  Item(
    id: 1,
    title: 'Mountain Hiking',
    subtitle: 'Adventure · 3h 20min',
    description:
        'A breathtaking trail through pine forests and rocky ridgelines. Suitable for intermediate hikers. Bring plenty of water and sunscreen.',
    category: 'Adventure',
    date: 'May 10, 2026',
    icon: Icons.terrain_outlined,
    color: const Color(0xFF1D9E75),
  ),
  Item(
    id: 2,
    title: 'Photography Walk',
    subtitle: 'Creative · 1h 45min',
    description:
        'Explore the old city district with your camera. Golden hour starts at 6:30 PM — perfect light for street photography.',
    category: 'Creative',
    date: 'May 11, 2026',
    icon: Icons.camera_alt_outlined,
    color: const Color(0xFF5B8AF0),
  ),
  Item(
    id: 3,
    title: 'Cooking Class',
    subtitle: 'Food · 2h 00min',
    description:
        'Learn to make authentic Italian pasta from scratch. A professional chef guides you step by step. All ingredients provided.',
    category: 'Food',
    date: 'May 12, 2026',
    icon: Icons.restaurant_outlined,
    color: const Color(0xFFE07C3A),
  ),
  Item(
    id: 4,
    title: 'Jazz Night',
    subtitle: 'Music · 3h 00min',
    description:
        'An intimate evening of live jazz at The Blue Room. Featuring three local ensembles and a guest saxophonist from New Orleans.',
    category: 'Music',
    date: 'May 13, 2026',
    icon: Icons.music_note_outlined,
    color: const Color(0xFF9B59B6),
  ),
  Item(
    id: 5,
    title: 'Yoga at Sunrise',
    subtitle: 'Wellness · 1h 00min',
    description:
        'Start your day with a rooftop yoga session as the sun rises over the skyline. All levels welcome. Mats provided.',
    category: 'Wellness',
    date: 'May 14, 2026',
    icon: Icons.self_improvement_outlined,
    color: const Color(0xFFE24B4A),
  ),
  Item(
    id: 6,
    title: 'City Cycling Tour',
    subtitle: 'Sport · 2h 30min',
    description:
        'A guided cycling route through the citys most scenic streets and parks. Bikes and helmets included. Flat terrain, easy pace.',
    category: 'Sport',
    date: 'May 15, 2026',
    icon: Icons.directions_bike_outlined,
    color: const Color(0xFF16A085),
  ),
  Item(
    id: 7,
    title: 'Book Club',
    subtitle: 'Education · 1h 30min',
    description:
        'This month we discuss "The Midnight Library" by Matt Haig. A lively conversation about life, regret, and second chances.',
    category: 'Education',
    date: 'May 16, 2026',
    icon: Icons.menu_book_outlined,
    color: const Color(0xFF8D6E63),
  ),
  Item(
    id: 8,
    title: 'Stargazing Night',
    subtitle: 'Science · 2h 00min',
    description:
        'Head to the dark-sky reserve outside the city for a guided stargazing session. Telescopes provided. Hot drinks available.',
    category: 'Science',
    date: 'May 17, 2026',
    icon: Icons.nights_stay_outlined,
    color: const Color(0xFF2C3E70),
  ),
];

// ─── Main Screen ──────────────────────────────────────────────
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _search = '';

  List<Item> get _filtered => kItems
      .where((i) =>
          i.title.toLowerCase().contains(_search.toLowerCase()) ||
          i.category.toLowerCase().contains(_search.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                          letterSpacing: -0.5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0EA),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xFFDDDDD5), width: 0.5),
                        ),
                        child: Text(
                          '${items.length} items',
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFF888780)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Search bar
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F0),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(0xFFDDDDD5), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        const Icon(Icons.search,
                            size: 18, color: Color(0xFFAAAAAA)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            onChanged: (v) => setState(() => _search = v),
                            decoration: const InputDecoration(
                              hintText: 'Search activities...',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Color(0xFFBBBBBB)),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF1A1A1A)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // List
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text('No results found',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFFAAAAAA))),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return _ItemCard(
                          item: item,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(item: item),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemCard extends StatefulWidget {
  final Item item;
  final VoidCallback onTap;

  const _ItemCard({required this.item, required this.onTap});

  @override
  State<_ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<_ItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _scale = Tween(begin: 1.0, end: 0.97)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border:
                Border.all(color: const Color(0xFFEEEEE8), width: 0.5),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon box
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(item.icon, color: item.color, size: 24),
              ),
              const SizedBox(width: 14),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF888780)),
                    ),
                  ],
                ),
              ),
              // Date + chevron
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.chevron_right,
                      color: Color(0xFFCCCCC5), size: 20),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: item.color.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item.category,
                      style: TextStyle(
                          fontSize: 10,
                          color: item.color,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Detail Screen ────────────────────────────────────────────
class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Column(
          children: [
            // Hero header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back_ios_new,
                            size: 16, color: Color(0xFF888780)),
                        const SizedBox(width: 4),
                        const Text('Back',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF888780))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Icon + title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: item.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(item.icon, color: item.color, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: item.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                item.category,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: item.color,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.subtitle,
                              style: const TextStyle(
                                  fontSize: 13, color: Color(0xFF888780)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Info cards row
                    Row(
                      children: [
                        Expanded(
                          child: _InfoTile(
                            icon: Icons.calendar_today_outlined,
                            label: 'Date',
                            value: item.date,
                            color: item.color,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _InfoTile(
                            icon: Icons.access_time_outlined,
                            label: 'Duration',
                            value: item.subtitle.split('·').last.trim(),
                            color: item.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Description card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color(0xFFEEEEE8), width: 0.5),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF888780),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1A1A1A),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Details grid
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color(0xFFEEEEE8), width: 0.5),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF888780),
                            ),
                          ),
                          const SizedBox(height: 12),
                          _DetailRow(
                              label: 'ID', value: '#${item.id.toString().padLeft(3, '0')}'),
                          const Divider(height: 20, color: Color(0xFFF0F0EA)),
                          _DetailRow(
                              label: 'Category', value: item.category),
                          const Divider(height: 20, color: Color(0xFFF0F0EA)),
                          _DetailRow(label: 'Date', value: item.date),
                          const Divider(height: 20, color: Color(0xFFF0F0EA)),
                          _DetailRow(
                              label: 'Duration',
                              value: item.subtitle.split('·').last.trim()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // CTA Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: item.color,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEE8), width: 0.5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 11, color: Color(0xFF888780))),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                const TextStyle(fontSize: 13, color: Color(0xFF888780))),
        Text(value,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A))),
      ],
    );
  }
}
