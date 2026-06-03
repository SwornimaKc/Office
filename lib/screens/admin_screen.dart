import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      padding: const EdgeInsets.all(12),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Overview",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: overviewCard(
                  icon: Icons.groups,
                  value: "24",
                  title: "Employees",
                  subtitle: "Total Employees",
                  color: Colors.blue,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: overviewCard(
                  icon: Icons.assignment,
                  value: "145",
                  title: "Tasks",
                  subtitle: "Total Tasks",
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [

              Expanded(
                child: overviewCard(
                  icon: Icons.check_circle,
                  value: "120",
                  title: "Completed",
                  subtitle: "82.8%",
                  color: Colors.orange,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: overviewCard(
                  icon: Icons.hourglass_bottom,
                  value: "15",
                  title: "Pending",
                  subtitle: "10.3%",
                  color: Colors.red,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "Task Summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.15),
                  blurRadius: 10,
                ),
              ],
            ),

            child: Column(
              children: [

                buildSummaryRow(
                  Colors.green,
                  "Completed",
                  "120 (82.8%)",
                ),

                buildSummaryRow(
                  Colors.orange,
                  "Pending",
                  "15 (10.3%)",
                ),

                buildSummaryRow(
                  Colors.blue,
                  "On The Way",
                  "7 (4.8%)",
                ),

                buildSummaryRow(
                  Colors.red,
                  "Busy",
                  "3 (2.1%)",
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              const Text(
                "Employee Management",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text("View All"),
              ),
            ],
          ),

          employeeCard(
            initials: "VK",
            name: "Vikram Singh",
            designation: "Assistant",
            room: "Room 103",
          ),

          employeeCard(
            initials: "RK",
            name: "Ramesh Kumar",
            designation: "Senior Assistant",
            room: "Room 101",
          ),

          employeeCard(
            initials: "SS",
            name: "Sunita Sharma",
            designation: "Section Officer",
            room: "Room 102",
          ),

          employeeCard(
            initials: "AD",
            name: "Anita Desai",
            designation: "Junior Assistant",
            room: "Room 104",
          ),

          const SizedBox(height: 25),

          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            children: [

              Expanded(
                child: quickAction(
                  Icons.person_add,
                  "Add Employee",
                  Colors.blue,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: quickAction(
                  Icons.shield,
                  "Assign Roles",
                  Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [

              Expanded(
                child: quickAction(
                  Icons.description,
                  "Export Report",
                  Colors.deepPurple,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: quickAction(
                  Icons.settings,
                  "Settings",
                  Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget overviewCard({
    required IconData icon,
    required String value,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: color,
            size: 35,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(title),

          const SizedBox(height: 5),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryRow(
      Color color,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        children: [

          CircleAvatar(
            radius: 6,
            backgroundColor: color,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(title),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget employeeCard({
    required String initials,
    required String name,
    required String designation,
    required String room,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.12),
            blurRadius: 8,
          ),
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            backgroundColor:
                Colors.blue.withOpacity(.1),

            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
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
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "$designation • $room",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget quickAction(
      IconData icon,
      String title,
      Color color,
      ) {
    return Container(
      height: 110,

      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            color: color,
            size: 35,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}