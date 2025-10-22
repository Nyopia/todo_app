import 'package:hive/hive.dart';

part 'work_session_model.g.dart'; //

@HiveType(typeId: 2) // Benzersiz Type ID: 2 = work_session
class WorkSessionModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String? taskId; // Çalışma bir göreve bağlı olabilir ya da olmayabilir.

  @HiveField(2)
  late DateTime startTime;

  @HiveField(3)
  late DateTime endTime;

  // Süreyi doğrudan saklamak, her seferinde hesaplama yapmaktan daha verimlidir.
  @HiveField(4)
  late int durationInSeconds;

  WorkSessionModel({
    required this.id,
    this.taskId,
    required this.startTime,
    required this.endTime,
    required this.durationInSeconds,
  });
}
