import 'package:flutter/material.dart';

class TaskHistory {
  final String employeeName;
  final String designation;
  final String task;
  final String time;
  final String status;

  TaskHistory({
    required this.employeeName,
    required this.designation,
    required this.task,
    required this.time,
    required this.status,
  });
}

class TaskHistoryScreen extends StatelessWidget {

  final String taskTitle;

  const TaskHistoryScreen({
    super.key,
    required this.taskTitle,
  });

  @override
  Widget build(BuildContext context) {

    final allTasks = [

      TaskHistory(
        employeeName: "Vikram Singh",
        designation: "Assistant",
        task: "Bring File",
        time: "10:30 AM",
        status: "Completed",
      ),

      TaskHistory(
        employeeName: "Ramesh Kumar",
        designation: "Senior Assistant",
        task: "Bring File",
        time: "11:15 AM",
        status: "Pending",
      ),

      TaskHistory(
        employeeName: "Sunita Sharma",
        designation: "Section Officer",
        task: "Prepare Tea",
        time: "12:00 PM",
        status: "Completed",
      ),

      TaskHistory(
        employeeName: "Anita Desai",
        designation: "Junior Assistant",
        task: "Urgent Meeting",
        time: "01:20 PM",
        status: "On The Way",
      ),
    ];

    final filteredTasks =
        allTasks.where((e) => e.task == taskTitle).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(taskTitle),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredTasks.length,

        itemBuilder: (context, index) {

          final item = filteredTasks[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),

            child: ListTile(

              leading: CircleAvatar(
                child: Text(
                  item.employeeName[0],
                ),
              ),

              title: Text(item.employeeName),

              subtitle: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(item.designation),
                  Text(item.time),
                ],
              ),

              trailing: Chip(
                label: Text(item.status),
              ),
            ),
          );
        },
      ),
    );
  }
}