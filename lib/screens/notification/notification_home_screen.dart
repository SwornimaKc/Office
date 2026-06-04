import 'package:flutter/material.dart';
import 'employee_task_notification.dart';
import 'notification_model.dart';
import 'notification_screen.dart';

class NotificationHomeScreen extends StatefulWidget {
  const NotificationHomeScreen({super.key});

  @override
  State<NotificationHomeScreen> createState() =>
      _NotificationHomeScreenState();
}

class _NotificationHomeScreenState extends State<NotificationHomeScreen> {
  // Sample multiple tasks data
  late List<TaskModel> tasks;

  @override
  void initState() {
    super.initState();
    tasks = [
      TaskModel(
        id: "1",
        employeeName: "Vikram Singh",
        designation: "Assistant",
        room: "Room 103",
        taskMessage: "Bring file from Accounts Department",
        timestamp: DateTime.now(),
        status: "Pending",
      ),
      TaskModel(
        id: "2",
        employeeName: "Ramesh Kumar",
        designation: "Senior Assistant",
        room: "Room 101",
        taskMessage: "Prepare tea for meeting",
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        status: "Pending",
      ),
      TaskModel(
        id: "3",
        employeeName: "Sunita Sharma",
        designation: "Section Officer",
        room: "Room 102",
        taskMessage: "Attend urgent meeting in cabin",
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        status: "Accepted",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: const TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Assigned Tasks"),
                Tab(text: "Tasks Updates"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                const NotificationScreen(),
                EmployeeTaskNotification(
                  tasks: tasks,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
