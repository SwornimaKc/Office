import 'package:flutter/material.dart';
import '../../models/employee.dart';


class EditEmployeeScreen extends StatefulWidget {
  final Employee employee;

  const EditEmployeeScreen({
    super.key,
    required this.employee,
  });

  @override
  State<EditEmployeeScreen> createState() =>
      _EditEmployeeScreenState();
}

class _EditEmployeeScreenState
    extends State<EditEmployeeScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(
      text: widget.employee.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Employee"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                widget.employee.name =
                    nameController.text;

                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}