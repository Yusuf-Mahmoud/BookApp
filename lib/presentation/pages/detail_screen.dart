import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';
import '../widgets/info_tile.dart';
import '../widgets/detail_row.dart';

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
                          child: InfoTile(
                            icon: Icons.calendar_today_outlined,
                            label: 'Date',
                            value: item.date,
                            color: item.color,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InfoTile(
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
                          DetailRow(
                              label: 'ID',
                              value: '#${item.id.toString().padLeft(3, '0')}'),
                          const Divider(height: 20, color: Color(0xFFF0F0EA)),
                          DetailRow(label: 'Category', value: item.category),
                          const Divider(height: 20, color: Color(0xFFF0F0EA)),
                          DetailRow(label: 'Date', value: item.date),
                          const Divider(height: 20, color: Color(0xFFF0F0EA)),
                          DetailRow(
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
