part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

// Uygulama başladığında veya görevler istendiğinde bu event gönderilecek.
class TasksLoaded extends TaskEvent {}

// --- TaskAdded ---
class TaskAdded extends TaskEvent {
  final TaskModel task;
  const TaskAdded(this.task);

  @override
  List<Object> get props => [task];
}

// --- TaskDeleted ---
class TaskDeleted extends TaskEvent {
  final String taskId;
  const TaskDeleted(this.taskId);

  @override
  List<Object> get props => [taskId];
}

// --- TaskUpdated ---
class TaskUpdated extends TaskEvent {
  final TaskModel task;
  const TaskUpdated(this.task);

  @override
  List<Object> get props => [task];
}
