import '../../domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required String title,
    required String subtitle,
    required String price,
  }) : super(title: title, subtitle: subtitle, price: price);

  factory ItemModel.fromMap(Map<String, String> map) {
    return ItemModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      price: map['price'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'price': price,
    };
  }
}
