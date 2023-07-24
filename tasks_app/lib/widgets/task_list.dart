import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map((tasks) => ExpansionPanelRadio(
                    value: tasks.id,
                    headerBuilder: (context, isOpen) => TaskTile(tasks: tasks),
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Text\n ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: tasks.title),
                            TextSpan(
                              text: '\n\nDescription\n ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: tasks.description),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}



// Expanded(
//       child: ListView.builder(
//         itemCount: tasksList.length,
//         itemBuilder: (context, index) {
//           var tasks = tasksList[index];

//           return TaskTile(tasks: tasks);
//         },
//       ),
//     );