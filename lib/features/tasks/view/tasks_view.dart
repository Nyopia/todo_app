import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/features/tasks/bloc/task_bloc.dart';
import 'package:todo_app/features/tasks/widgets/add_task_dialog.dart';
import 'package:todo_app/features/tasks/widgets/edit_task_sheet.dart';
import 'package:todo_app/features/tasks/widgets/task_card.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Görevlerim')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //  Diyaloğu göster ve sonucun gelmesini bekle.
          final title = await showDialog<String>(
            context: context,
            builder: (BuildContext dialogContext) {
              return const AddTaskDialog();
            },
          );

          //  Diyalog tamamen kapandıktan sonra BLoC ile güvenle konuş.
          if (title != null && title.isNotEmpty && context.mounted) {
            final newTask = TaskModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: title,
              isCompleted: false,
              createdAt: DateTime.now(),
              tagIds: [],
            );
            context.read<TaskBloc>().add(TaskAdded(newTask));
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TasksLoadSuccess) {
            if (state.tasks.isEmpty) {
              return const Center(
                child: Text(
                  'Harika! Hiç görevin yok.\nYeni bir tane ekleyerek başla.',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return TaskCard(
                  task: task,
                  onTap: () async {
                    final updatedTask = await showModalBottomSheet<TaskModel>(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      builder: (sheetContext) {
                        return EditTaskSheet(task: task);
                      },
                    );
                    if (updatedTask != null && context.mounted) {
                      context.read<TaskBloc>().add(TaskUpdated(updatedTask));
                    }
                  },
                  onStatusChanged: (isCompleted) {
                    final updatedTask = task.copyWith(isCompleted: isCompleted);
                    context.read<TaskBloc>().add(TaskUpdated(updatedTask));
                  },
                  onDeleted: () {
                    context.read<TaskBloc>().add(TaskDeleted(task.id));
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            );
          }
          if (state is TasksLoadFailure) {
            return const Center(child: Text('Görevler yüklenemedi.'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
