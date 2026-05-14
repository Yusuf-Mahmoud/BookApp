import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../domain/entities/item_entity.dart';

class DetailScreenPage extends StatelessWidget {
  final ItemEntity item;

  const DetailScreenPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: appAccentColor.withOpacity(0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              IconButton(
                icon: const Icon(Icons.close, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: appAccentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'PREMIUM',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(item.title,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(item.price,
                        style: const TextStyle(
                            fontSize: 24, color: appAccentColor)),
                    const SizedBox(height: 30),
                    const Text(
                      'This is a masterpiece of modern engineering and design. '
                      'Every detail has been crafted to provide an unparalleled experience. '
                      'Experience the future today with this limited edition release.',
                      style: TextStyle(
                          color: Colors.white70, fontSize: 18, height: 1.6),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appAccentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
