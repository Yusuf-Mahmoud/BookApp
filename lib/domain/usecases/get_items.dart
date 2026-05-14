import '../entities/item.dart';
import '../repositories/item_repository.dart';

class GetItemsUseCase {
  final ItemRepository repository;

  GetItemsUseCase(this.repository);

  List<Item> call() {
    return repository.getItems();
  }
}
