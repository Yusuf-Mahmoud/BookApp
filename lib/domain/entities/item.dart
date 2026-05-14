import 'package:flutter/material.dart';

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
