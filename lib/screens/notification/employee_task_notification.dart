import 'package:flutter/material.dart';

class EmployeeTaskNotification extends StatefulWidget {
  final String employeeName;
  final String taskMessage;
  final String time;
  final VoidCallback? onCompleted;

  const EmployeeTaskNotification({
    super.key,
    this.onCompleted,
    required this.employeeName,
    required this.taskMessage,
    required this.time,
     
  });

  @override
  State<EmployeeTaskNotification> createState() =>
      _EmployeeTaskNotificationState();
}

class _EmployeeTaskNotificationState
    extends State<EmployeeTaskNotification> {
  String currentStatus = "Pending";

      bool get isCompleted => currentStatus == "Completed";

  Color getStatusColor() {
    switch (currentStatus) {
      case "Accepted":
        return Colors.green;
      case "On The Way":
        return Colors.blue;
      case "Busy":
        return Colors.orange;
      case "Completed":
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
    void updateStatus(String status) {
    if (isCompleted) return;

    setState(() {
      currentStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            widget.employeeName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            widget.taskMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),

          Text(
            widget.time,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: getStatusColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                currentStatus,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          buildButton(
            "Accept",
            Colors.green,
            () => updateStatus("Accepted"),
          
          ),

          buildButton(
            "On The Way",
            Colors.blue,
            () => updateStatus("On The Way"),
          ),

          buildButton(
            "Busy",
            Colors.orange,
            () => updateStatus("Busy"),
          ),

          buildButton(
            "Completed",
            Colors.grey,
            () => updateStatus("Completed"),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isCompleted ? null : onTap,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}