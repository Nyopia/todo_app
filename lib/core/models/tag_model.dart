import 'package:hive/hive.dart';

part 'tag_model.g.dart';

@HiveType(typeId: 1) // Benzersiz Type ID: 1 = tag
class TagModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late int color; // Renk kodunu integer olarak saklayacağız.

  TagModel({required this.id, required this.name, required this.color});
}
