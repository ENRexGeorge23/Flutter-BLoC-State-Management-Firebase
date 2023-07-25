import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/screens/edit_task_screen.dart';
import 'package:tasks_app/widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.tasks,
  });

  final Task tasks;

  void _removedOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(
            oldTask: tasks,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                tasks.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tasks.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration:
                              tasks.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(DateFormat.yMMMd()
                          .add_jms()
                          .format(DateTime.parse(tasks.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: tasks.isDone,
                onChanged: tasks.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(
                              UpdateTask(task: tasks),
                            );
                      }
                    : null,
              ),
              PopUpMenu(
                  task: tasks,
                  cancelorDeleteCallback: () =>
                      _removedOrDeleteTask(context, tasks),
                  likeOrDislikeCallback: () => context.read<TasksBloc>().add(
                        MarkFavoriteOrUnfavoriteTask(task: tasks),
                      ),
                  editTaskCallback: () {
                    Navigator.of(context).pop();
                    _editTask(context);
                  },
                  restoreTaskCallback: () => context.read<TasksBloc>().add(
                        RestoreTask(task: tasks),
                      ))
            ],
          ),
        ],
      ),
    );
  }
}
