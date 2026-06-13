import 'package:flutter/material.dart';
import '../../models/employee.dart';


class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() =>
      _AddEmployeeScreenState();
}

class _AddEmployeeScreenState
    extends State<AddEmployeeScreen> {

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController designationController =
      TextEditingController();

  final TextEditingController roomController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    designationController.dispose();
    roomController.dispose();
    super.dispose();
  }

  void saveEmployee() {

    if (nameController.text.trim().isEmpty ||
        designationController.text.trim().isEmpty ||
        roomController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
          ),
        ),
      );

      return;
    }

    final employee = Employee(
      name: nameController.text.trim(),
      designation: designationController.text.trim(),
      room: roomController.text.trim(),
    );

    Navigator.pop(context, employee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Employee"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Employee Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: designationController,
              decoration: const InputDecoration(
                labelText: "Designation",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: roomController,
              decoration: const InputDecoration(
                labelText: "Room Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: saveEmployee,

                child: const Text(
                  "Add Employee",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}