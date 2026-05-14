import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_local_data_source.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl(this.localDataSource);

  @override
  Future<List<ItemEntity>> getItems() async {
    return localDataSource.fetchItems();
  }
}
