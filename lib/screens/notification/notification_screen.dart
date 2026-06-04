import 'package:flutter/material.dart';

import 'notification_model.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    final notifications = [
      TaskModel(
        id: "1",
        employeeName: "Vikram Singh",
        designation: "Assistant",
        room: "Room 103",
        taskMessage: "Please bring the file from Accounts Department.",
        timestamp: DateTime.now(),
        status: "Accepted",
      ),
      TaskModel(
        id: "2",
        employeeName: "Ramesh Kumar",
        designation: "Senior Assistant",
        room: "Room 101",
        taskMessage: "Please prepare tea for meeting.",
        timestamp: DateTime.now(),
        status: "Pending",    
      ),
      TaskModel(
        id: "3",
        employeeName: "Sunita Sharma",
        designation: "Section Officer",
        room: "Room 102",
        taskMessage: "Please attend urgent meeting.",
        timestamp: DateTime.now(),
        status: "On The Way",
      ),
      TaskModel(
        id: "4",
        employeeName: "Anita Desai",
        designation: "Junior Assistant",
        room: "Room 104",
        taskMessage: "Arrange files in cabinet.",
        timestamp: DateTime.now(),
        status: "Completed",
      ),
      TaskModel(
        id: "5",
        employeeName: "Priya Sharma",
        designation: "Assistant",
        room: "Room 105",
        taskMessage: "Send report to manager.",
        timestamp: DateTime.now(),
        status: "Busy",
      ),
    ];

    final filtered = selectedFilter == "All"
        ? notifications
        : notifications
            .where((e) => e.status == selectedFilter)
            .toList();

    return Column(
      children: [
        const SizedBox(height: 12),

        // FILTERS
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              filterChip("All"),
              filterChip("Pending"),
              filterChip("Accepted"),
              filterChip("On The Way"),
              filterChip("Busy"),
              filterChip("Completed"),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_none,
                        size: 80,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No tasks assigned",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final task = filtered[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.15),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          // Header with avatar, name, and status badge
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.blue.shade100,
                                child: Text(
                                  getInitials(task.employeeName),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.employeeName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      "${task.designation} • ${task.room}",
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Status Badge
                              statusBadge(task.status),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Task icon and label
                          Row(
                            children: [
                              Icon(
                                _getTaskIcon(task.taskMessage),
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Task",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Task message
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              task.taskMessage,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget filterChip(String text) {
    bool selected = selectedFilter == text;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        onSelected: (_) {
          setState(() {
            selectedFilter = text;
          });
        },
      ),
    );
  }

  Widget statusBadge(String status) {
    Color bgColor;
    Color textColor;
    IconData icon;

    switch (status) {
      case "Accepted":
        bgColor = Colors.green.shade100;
        textColor = Colors.green;
        icon = Icons.check_circle;
        break;
      case "On The Way":
        bgColor = Colors.blue.shade100;
        textColor = Colors.blue;
        icon = Icons.directions_run;
        break;
      case "Busy":
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange;
        icon = Icons.access_time;
        break;
      case "Completed":
        bgColor = Colors.grey.shade100;
        textColor = Colors.grey;
        icon = Icons.done_all;
        break;
      case "Pending":
      default:
        bgColor = Colors.red.shade100;
        textColor = Colors.red;
        icon = Icons.schedule;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String getInitials(String name) {
    final parts = name.split(" ");
    if (parts.length >= 2) {
      return "${parts[0][0]}${parts[1][0]}";
    }
    return name[0];
  }

  IconData _getTaskIcon(String taskMessage) {
    if (taskMessage.toLowerCase().contains("file")) {
      return Icons.folder;
    } else if (taskMessage.toLowerCase().contains("tea")) {
      return Icons.coffee;
    } else if (taskMessage.toLowerCase().contains("meeting")) {
      return Icons.groups;
    } else if (taskMessage.toLowerCase().contains("arrange")) {
      return Icons.check_circle;
    } else if (taskMessage.toLowerCase().contains("report")) {
      return Icons.description;
    }
    return Icons.task_alt;
  }
}
