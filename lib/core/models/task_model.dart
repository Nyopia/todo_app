import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(
  typeId: 0,
) // Hive'a bu sınıfı tanıması için bir kimlik veriyoruz. 0 = task
class TaskModel extends HiveObject {
  @HiveField(0) // Alanlar için de benzersiz kimlikler veriyoruz.
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late bool isCompleted;

  @HiveField(3)
  late DateTime createdAt;

  @HiveField(4)
  late List<String> tagIds; // Bu göreve bağlı etiketlerin ID'lerini tutacağız.

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.tagIds,
  });
}
