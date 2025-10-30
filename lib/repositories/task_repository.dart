import 'package:hive/hive.dart';
import 'package:todo_app/core/models/task_model.dart';

class TaskRepository {
  // Görevleri saklayacağımız kutu
  static const String _boxName = 'tasks';

  // kutuya erişim için getter oluşturuyoruz
  Box<TaskModel> get _taskBox => Hive.box<TaskModel>(_boxName);

  // Tüm görevleri getirme
  Future<List<TaskModel>> getAllTasks() async {
    return _taskBox.values.toList();
  }

  // Görev ekleme
  Future<void> addTask(TaskModel task) async {
    await _taskBox.put(task.id, task);
  }

  // Görev Silme
  Future<void> deleteTask(String TaskId) async {
    await _taskBox.delete(TaskId);
  }

  // Görev güncelleme
  Future<void> updateTask(TaskModel task) async {
    await _taskBox.put(task.id, task);
  }
}
