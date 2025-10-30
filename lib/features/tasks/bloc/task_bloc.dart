import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;
  TaskBloc({required TaskRepository taskRepository})
    : _taskRepository = taskRepository,
      super(TasksInitial()) {
    on<TasksLoaded>(_onTasksLoaded);
    on<TaskAdded>(_onTaskAdded);
    on<TaskDeleted>(_onTaskDeleted);
    on<TaskUpdated>(_onTaskUpdated);
  }

  // --- TasksLoaded ---
  Future<void> _onTasksLoaded(
    TasksLoaded event,
    Emitter<TaskState> emit,
  ) async {
    emit(TasksLoadInProgress());
    try {
      final tasks = await _taskRepository.getAllTasks();
      emit(TasksLoadSuccess(tasks: tasks));
    } catch (e) {
      emit(TasksLoadFailure());
    }
  }

  // --- TaskAdded ---
  Future<void> _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) async {
    // Görevi önce repoya ekliyoruz
    await _taskRepository.addTask(event.task);
    // Sonra tüm görevleri yeniden yükle
    add(TasksLoaded());
  }

  // --- TaskUpdated ---
  Future<void> _onTaskUpdated(
    TaskUpdated event,
    Emitter<TaskState> emit,
  ) async {
    await _taskRepository.updateTask(event.task);
    add(TasksLoaded());
  }

  // --- TaskDeleted ----
  Future<void> _onTaskDeleted(
    TaskDeleted event,
    Emitter<TaskState> emit,
  ) async {
    await _taskRepository.deleteTask(event.taskId);
    add(TasksLoaded());
  }
}
