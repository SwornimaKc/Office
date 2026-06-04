import 'package:flutter/material.dart';
import 'notification_model.dart';


class EmployeeTaskNotification extends StatefulWidget {
  final List<TaskModel>? tasks;
  final String? employeeName;
  final String? taskMessage;
  final String? time;
  final VoidCallback? onCompleted;

  const EmployeeTaskNotification({
    super.key,
    this.onCompleted,
    this.tasks,
    this.employeeName,
    this.taskMessage,
    this.time,
  });

  @override
  State<EmployeeTaskNotification> createState() =>
      _EmployeeTaskNotificationState();
}

class _EmployeeTaskNotificationState
    extends State<EmployeeTaskNotification> {
  late List<TaskModel> taskList;

  @override
  void initState() {
    super.initState();
    // Support both old single task and new multiple tasks
    if (widget.tasks != null && widget.tasks!.isNotEmpty) {
      taskList = List.from(widget.tasks!);
    } else if (widget.employeeName != null) {
      // Legacy support for single task
      taskList = [
        TaskModel(
          id: "1",
          employeeName: widget.employeeName!,
          designation: "Employee",
          room: "Room 101",
          taskMessage: widget.taskMessage!,
          timestamp: DateTime.now(),
          status: "Pending",
        )
      ];
    } else {
      taskList = [];
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Accepted":
        return Colors.green;
      case "On The Way":
        return Colors.blue;
      case "Busy":
        return Colors.orange;
      case "Completed":
        return Colors.grey;
      case "Pending":
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  void updateStatus(TaskModel task, String status) {
    if (task.status == "Completed") return;

    setState(() {
      task.status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show empty state message if no tasks
    if (taskList.isEmpty) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 120,
            ),
            const SizedBox(height: 30),
            const Text(
              "No Tasks Assigned",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "You don't have any tasks assigned right now.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      );
    }

    // Single task view
    if (taskList.length == 1) {
      return _buildSingleTaskView(taskList[0]);
    }

    // Multiple tasks list view
    return _buildMultipleTasksView();
  }

  Widget _buildSingleTaskView(TaskModel task) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Icon(
            Icons.notifications_active,
            color: Colors.blue,
            size: 120,
          ),
          const SizedBox(height: 30),
          Text(
            task.employeeName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${task.designation} • ${task.room}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            task.taskMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text(
            "${task.timestamp.hour}:${task.timestamp.minute.toString().padLeft(2, '0')}",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: getStatusColor(task.status),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                task.status,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildStatusButtons(task),
        ],
      ),
    );
  }

  Widget _buildMultipleTasksView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        final task = taskList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with employee info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        task.employeeName[0].toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.employeeName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${task.designation} • ${task.room}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${task.timestamp.hour}:${task.timestamp.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Task message
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Text(
                    task.taskMessage,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),

                // Status display
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getStatusColor(task.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: getStatusColor(task.status),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      task.status,
                      style: TextStyle(
                        color: getStatusColor(task.status),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Status buttons (compact)
                SizedBox(
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCompactButton(
                        task,
                        "Accept",
                        Colors.green,
                      ),
                      const SizedBox(width: 8),
                      _buildCompactButton(
                        task,
                        "On Way",
                        Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      _buildCompactButton(
                        task,
                        "Busy",
                        Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      _buildCompactButton(
                        task,
                        "Done",
                        Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusButtons(TaskModel task) {
    return Column(
      children: [
        buildButton(
          "Accept",
          Colors.green,
          () => updateStatus(task, "Accepted"),
          task.status == "Completed",
        ),
        buildButton(
          "On The Way",
          Colors.blue,
          () => updateStatus(task, "On The Way"),
          task.status == "Completed",
        ),
        buildButton(
          "Busy",
          Colors.orange,
          () => updateStatus(task, "Busy"),
          task.status == "Completed",
        ),
        buildButton(
          "Completed",
          Colors.grey,
          () => updateStatus(task, "Completed"),
          task.status == "Completed",
        ),
      ],
    );
  }

  Widget _buildCompactButton(
    TaskModel task,
    String title,
    Color color,
  ) {
    final isDisabled = task.status == "Completed";
    final status = title == "Accept"
        ? "Accepted"
        : title == "On Way"
            ? "On The Way"
            : title == "Busy"
                ? "Busy"
                : "Completed";

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        disabledBackgroundColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: isDisabled ? null : () => updateStatus(task, status),
      child: Text(
        title,
        style: TextStyle(
          color: isDisabled ? Colors.grey.shade500 : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildButton(
    String title,
    Color color,
    VoidCallback onTap,
    bool isDisabled,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            disabledBackgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isDisabled ? null : onTap,
          child: Text(
            title,
            style: TextStyle(
              color: isDisabled ? Colors.grey.shade500 : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
