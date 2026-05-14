import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  @override
  List<Item> getItems() {
    return kItems;
  }
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
