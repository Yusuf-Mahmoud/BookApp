import 'package:flutter/material.dart';
import '../../domain/usecases/get_items.dart';
import '../../domain/entities/item.dart';
import '../widgets/item_card.dart';
import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  final GetItemsUseCase getItemsUseCase;

  const MainScreen({super.key, required this.getItemsUseCase});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _search = '';
  late List<Item> _allItems;

  @override
  void initState() {
    super.initState();
    _allItems = widget.getItemsUseCase.call();
  }

  List<Item> get _filtered => _allItems
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
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ItemCard(
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
