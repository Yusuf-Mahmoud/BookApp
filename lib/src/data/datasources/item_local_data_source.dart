import '../models/item_model.dart';

class ItemLocalDataSource {
  List<ItemModel> fetchItems() {
    return const [
      ItemModel(
        title: 'Cyberpunk Car',
        subtitle: 'Future of speed',
        price: '\$250,000',
      ),
      ItemModel(
        title: 'Neon Watch',
        subtitle: 'Precision & Style',
        price: '\$1,200',
      ),
      ItemModel(
        title: 'Glass Phone',
        subtitle: 'See through tech',
        price: '\$3,500',
      ),
    ];
  }
}
