import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyItems = [
      {
        "name": "Ramesh Kumar",
        "message": "Bring file from Accounts Department",
        "status": "Completed",
        "time": "10:30 AM | 20 May",
      },
      {
        "name": "Sunita Sharma",
        "message": "Prepare tea for meeting",
        "status": "On The Way",
        "time": "09:15 AM | 20 May",
      },
      {
        "name": "Vikram Singh",
        "message": "Urgent meeting in cabin",
        "status": "Busy",
        "time": "Yesterday | 03:45 PM",
      },
      {
        "name": "Anita Verma",
        "message": "Come immediately",
        "status": "Pending",
        "time": "Yesterday | 11:20 AM",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: Column(
        children: [
          const SizedBox(height: 16),

          /// FILTER BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterButton("All Status"),

                  const SizedBox(width: 8),

                  _filterButton("Today"),

                  const SizedBox(width: 8),

                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 18),
                    label: const Text("Export"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// HISTORY LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];

                return HistoryCard(
                  name: item["name"]!,
                  message: item["message"]!,
                  status: item["status"]!,
                  time: item["time"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget _filterButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String name;
  final String message;
  final String status;
  final String time;

  const HistoryCard({
    super.key,
    required this.name,
    required this.message,
    required this.status,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    switch (status) {
      case "Completed":
        statusColor = Colors.green;
        break;
      case "On The Way":
        statusColor = Colors.blue;
        break;
      case "Busy":
        statusColor = Colors.orange;
        break;
      case "Pending":
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          /// PROFILE
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),

          const SizedBox(width: 12),

          /// DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          /// STATUS BADGE
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}