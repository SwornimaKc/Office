import 'package:flutter/material.dart';

import 'employee_widgets/activity_tile.dart';
import 'employee_widgets/employee_action_card.dart';
import 'employee_widgets/employee_header.dart';
import 'employee_widgets/employee_overview_card.dart';
import 'employee_widgets/employee_task_card.dart';


class EmployeeDashboardScreen extends StatelessWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: const Color(0xffF7F9FC),
      
       appBar: AppBar(
        backgroundColor: const Color(0xff0D6FFF),
        title: const Text("Employee Dashboard"),
        elevation: 0,
      ),
      
     

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const EmployeeHeader(),

              const SizedBox(height: 20),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5,

                children: const [
                  EmployeeOverviewCard(
                    title: "My Tasks",
                    value: "12",
                    icon: Icons.assignment,
                    color: Colors.blue,
                  ),
                  EmployeeOverviewCard(
                    title: "Pending",
                    value: "4",
                    icon: Icons.schedule,
                    color: Colors.orange,
                  ),
                  EmployeeOverviewCard(
                    title: "Completed",
                    value: "8",
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                  EmployeeOverviewCard(
                    title: "Alerts",
                    value: "2",
                    icon: Icons.notifications,
                    color: Colors.red,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Today's Task Summary",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.schedule,
                              color: Colors.orange),
                          SizedBox(height: 6),
                          Text("4"),
                          Text("Pending"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.directions_walk,
                              color: Colors.blue),
                          SizedBox(height: 6),
                          Text("2"),
                          Text("On The Way"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green),
                          SizedBox(height: 6),
                          Text("8"),
                          Text("Completed"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "My Current Tasks",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const EmployeeTaskCard(
                title: "Collect Documents",
                assignedBy: "Section Officer",
                status: "Pending",
                icon: Icons.folder,
              ),

              const EmployeeTaskCard(
                title: "Prepare Tea For Meeting",
                assignedBy: "Admin",
                status: "On The Way",
                icon: Icons.local_cafe,
              ),

              const EmployeeTaskCard(
                title: "Attend Staff Meeting",
                assignedBy: "Officer",
                status: "Completed",
                icon: Icons.groups,
              ),

              const SizedBox(height: 25),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [

                  Expanded(
                    child: EmployeeActionCard(
                      icon: Icons.assignment,
                      title: "My Tasks",
                      color: Colors.blue,
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: EmployeeActionCard(
                      icon: Icons.notifications,
                      title: "Notifications",
                      color: Colors.orange,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const ActivityTile(
                icon: Icons.check_circle,
                title: "Task Completed",
                subtitle: "20 minutes ago",
              ),

              const ActivityTile(
                icon: Icons.assignment,
                title: "New Task Assigned",
                subtitle: "45 minutes ago",
              ),

              const ActivityTile(
                icon: Icons.person,
                title: "Attendance Marked",
                subtitle: "08:45 AM",
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}