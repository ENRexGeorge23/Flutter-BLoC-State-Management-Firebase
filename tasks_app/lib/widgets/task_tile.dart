import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';
import 'package:tasks_app/models/task.dart';

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
                const Icon(Icons.star_outline),
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
                      Text(DateTime.now().toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}


//  return ListTile(
//       title: 