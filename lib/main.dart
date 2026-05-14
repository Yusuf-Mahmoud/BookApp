import 'package:flutter/material.dart';
import 'data/repositories/item_repository_impl.dart';
import 'domain/repositories/item_repository.dart';
import 'domain/usecases/get_items.dart';
import 'presentation/pages/main_screen.dart';

void main() {
  // Dependency Injection
  final ItemRepository itemRepository = ItemRepositoryImpl();
  final GetItemsUseCase getItemsUseCase = GetItemsUseCase(itemRepository);

  runApp(MyApp(getItemsUseCase: getItemsUseCase));
}

class MyApp extends StatelessWidget {
  final GetItemsUseCase getItemsUseCase;

  const MyApp({super.key, required this.getItemsUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Items App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MainScreen(getItemsUseCase: getItemsUseCase),
    );
  }
}
