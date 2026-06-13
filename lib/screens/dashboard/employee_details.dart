import 'package:flutter/material.dart';
import 'package:tmobile_app/screens/dashboard/message_pop.dart';

import '../../constants/app_colors.dart';



class EmployeeCard extends StatelessWidget {

  final String name;
  final String designation;
  final String room;

  const EmployeeCard({
    super.key,
    required this.name,
    required this.designation,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(

          children: [

            // Profile
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 16),

            // Employee Info
            Expanded(
              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(designation),

                  const SizedBox(height: 4),

                  Text(
                    room,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Notification Bell Icon
            IconButton(

              icon: const Icon(
                Icons.notifications,
                color: Colors.blue,
                size: 30,
              ),

              onPressed: () {

                showDialog(

                  context: context,

                  builder: (_) => EmployeeMessagePopup(
                    employeeName: name,
                    designation: designation,
                    room: room,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}