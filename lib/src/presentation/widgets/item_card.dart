import 'package:flutter/material.dart';

import '../../domain/entities/item_entity.dart';
import '../../core/app_theme.dart';

class ItemCard extends StatelessWidget {
  final ItemEntity item;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appAccentColor.withOpacity(0.2),
              Colors.purpleAccent.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(item.subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,
                color: appAccentColor, size: 18),
          ],
        ),
      ),
    );
  }
}
