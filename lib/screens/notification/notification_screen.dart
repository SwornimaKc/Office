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

      {
        "model": NotificationModel(
          title: "Vikram Singh",
          description:
              "Please bring the file from Accounts Department.",
          timestamp: DateTime.now(),
        ),
        "designation": "Assistant",
        "room": "Room 103",
        "status": "Accepted",
        "icon": Icons.folder,
      },

      {
        "model": NotificationModel(
          title: "Ramesh Kumar",
          description: "Please prepare tea for meeting.",
          timestamp: DateTime.now(),
        ),
        "designation": "Senior Assistant",
        "room": "Room 101",
        "status": "Pending",
        "icon": Icons.coffee,
      },

      {
        "model": NotificationModel(
          title: "Sunita Sharma",
          description: "Please attend urgent meeting.",
          timestamp: DateTime.now(),
        ),
        "designation": "Section Officer",
        "room": "Room 102",
        "status": "Busy",
        "icon": Icons.groups,
      },
    ];

    final filtered = selectedFilter == "All"
        ? notifications
        : notifications
            .where((e) => e["status"] == selectedFilter)
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
              filterChip("Busy"),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: filtered.length,

            itemBuilder: (context, index) {

              final data = filtered[index];
              final item = data["model"] as NotificationModel;

              return InkWell(

                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => EmployeeTaskNotification(
                  //       employeeName: item.title,
                  //       taskMessage: item.description,
                  //       time:
                  //           "${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}",
                  //     ),
                  //   ),
                  // );
                },

                child: Container(

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

                      Row(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          CircleAvatar(
                            radius: 24,
                            backgroundColor:
                                Colors.blue.shade100,

                            child: Text(
                              getInitials(item.title),
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
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 3),

                                Text(
                                  "${data["designation"]} • ${data["room"]}",
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Text(
                            "${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [

                          Icon(
                            data["icon"] as IconData,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 12),

                          const Text(
                            "Task",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.description,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [

                          statusChip(
                            data["status"] as String,
                          ),

                          const Spacer(),

                         
                        ],
                      ),
                    ],
                  ),
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

  Widget statusChip(String status) {

    Color bgColor;

    Color textColor;

    switch (status) {

      case "Accepted":
        bgColor = Colors.green.shade100;
        textColor = Colors.green;
        break;

      case "Busy":
        bgColor = Colors.red.shade100;
        textColor = Colors.red;
        break;

      case "Pending":
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange;
        break;

      default:
        bgColor = Colors.grey.shade100;
        textColor = Colors.grey;
    }

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
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
}