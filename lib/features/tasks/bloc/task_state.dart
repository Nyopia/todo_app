part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TasksInitial extends TaskState {}

final class TasksLoadInProgress extends TaskState {}

final class TasksLoadSuccess extends TaskState {
  final List<TaskModel> tasks;

  const TasksLoadSuccess({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

final class TasksLoadFailure extends TaskState {}
