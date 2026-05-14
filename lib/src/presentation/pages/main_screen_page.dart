import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../data/datasources/item_local_data_source.dart';
import '../../data/repositories/item_repository_impl.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/usecases/get_items_usecase.dart';
import '../widgets/item_card.dart';
import 'detail_screen_page.dart';

class MainScreenPage extends StatelessWidget {
  MainScreenPage({super.key});

  final GetItemsUseCase _getItemsUseCase =
      GetItemsUseCase(ItemRepositoryImpl(ItemLocalDataSource()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'EXPLORE',
          style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<ItemEntity>>(
        future: _getItemsUseCase.execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ItemCard(
                  item: item,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreenPage(item: item),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child:
                Text('No items found', style: TextStyle(color: Colors.white70)),
          );
        },
      ),
    );
  }
}
