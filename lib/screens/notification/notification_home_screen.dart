import 'package:flutter/material.dart';
import 'employee_task_notification.dart';

import 'notification_screen.dart';


class NotificationHomeScreen extends StatelessWidget {
  const NotificationHomeScreen({super.key});

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
                Tab(text: "Officer Notifications"),
                Tab(text: "Employee Tasks"),
              ],
            ),
          ),

          const Expanded(
            child: TabBarView(
              children: [
                NotificationScreen(),
               
                 EmployeeTaskNotification(
                   employeeName: "Vikram Singh",
                    taskMessage: "Bring file from Accounts",
                    time: "10:45 AM",
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}