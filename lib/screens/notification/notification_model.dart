class TaskModel {
  final String id;
  final String employeeName;
  final String designation;
  final String room;
  final String taskMessage;
  final DateTime timestamp;
  String status; // Pending, Accepted, On The Way, Busy, Completed

  TaskModel({
    required this.id,
    required this.employeeName,
    required this.designation,
    required this.room,
    required this.taskMessage,
    required this.timestamp,
    this.status = "Pending",
  });
}
