import '../models/employee.dart';

class EmployeeService {
  static List<Employee> employees = [
    Employee(
      name: "Vikram Singh",
      designation: "Assistant",
      room: "Room 103",
    ),
    Employee(
      name: "Ramesh Kumar",
      designation: "Senior Assistant",
      room: "Room 101",
    ),
  ];
}