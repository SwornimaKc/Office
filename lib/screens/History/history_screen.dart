import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedStatus = "All Status";
  String selectedDate = "All Time";

  @override
  Widget build(BuildContext context) {
    final historyItems = [
      {
        "name": "Ramesh Kumar",
        "message": "Bring file from Accounts Department",
        "status": "Completed",
        "time": "10:30 AM | 20 May",
        "date": "Today",
      },
      {
        "name": "Sunita Sharma",
        "message": "Prepare tea for meeting",
        "status": "On The Way",
        "time": "09:15 AM | 20 May",
        "date": "Today",
      },
      {
        "name": "Vikram Singh",
        "message": "Urgent meeting in cabin",
        "status": "Busy",
        "time": "Yesterday | 03:45 PM",
        "date": "Yesterday",
      },
      {
        "name": "Anita Verma",
        "message": "Come immediately",
        "status": "Pending",
        "time": "Yesterday | 11:20 AM",
        "date": "Yesterday",
      },
      {
        "name": "Priya Sharma",
        "message": "Send report to manager",
        "status": "Completed",
        "time": "02:00 PM | 19 May",
        "date": "Last Week",
      },
      {
        "name": "Rajesh Singh",
        "message": "Fix the printer issue",
        "status": "Completed",
        "time": "11:00 AM | 18 May",
        "date": "Last Week",
      },
    ];

    // Filter items based on selected status and date
    final filteredItems = historyItems.where((item) {
      bool statusMatch = selectedStatus == "All Status" ||
          item["status"] == selectedStatus;
      bool dateMatch = selectedDate == "All Time" ||
          item["date"] == selectedDate;
      return statusMatch && dateMatch;
    }).toList();

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
                  /// Status Filter Dropdown
                  _buildStatusFilterButton(),
                  const SizedBox(width: 8),

                  /// Date Filter Dropdown
                  _buildDateFilterButton(),
                  const SizedBox(width: 8),

                  OutlinedButton.icon(
                    onPressed: () {
                      // Export functionality can be added later
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Export feature coming soon!")),
                      );
                    },
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
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          size: 80,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No history found",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

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

  Widget _buildStatusFilterButton() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          selectedStatus = value;
        });
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: "All Status",
          child: Text("All Status"),
        ),
        const PopupMenuItem(
          value: "Completed",
          child: Text("Completed"),
        ),
        const PopupMenuItem(
          value: "On The Way",
          child: Text("On The Way"),
        ),
        const PopupMenuItem(
          value: "Busy",
          child: Text("Busy"),
        ),
        const PopupMenuItem(
          value: "Pending",
          child: Text("Pending"),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
              selectedStatus,
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
      ),
    );
  }

  Widget _buildDateFilterButton() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          selectedDate = value;
        });
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: "All Time",
          child: Text("All Time"),
        ),
        const PopupMenuItem(
          value: "Today",
          child: Text("Today"),
        ),
        const PopupMenuItem(
          value: "Yesterday",
          child: Text("Yesterday"),
        ),
        const PopupMenuItem(
          value: "Last Week",
          child: Text("Last Week"),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
              selectedDate,
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
