import 'package:flutter/material.dart';
import 'package:todo_app/features/tasks/bloc/task_bloc.dart';
import 'package:todo_app/features/tasks/view/tasks_view.dart';
import 'package:todo_app/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc(taskRepository: TaskRepository())..add(TasksLoaded()),

      child: const TasksView(),
    );
  }
}
