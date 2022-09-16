import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    this.images,
  });

  factory ProductModel.fromMap(Map<String, dynamic>? map) => ProductModel(
        id: map?['id'] as int,
        title: map?['title'] as String,
        description: map?['description'] as String,
        images: (map?['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String>? images;
}
