import 'package:flutter/material.dart';
import 'package:tmobile_app/widgets/employee_card.dart';
import '../../services/employee_service.dart';
import '../../widgets/overview_card.dart';
import '../../widgets/quick_action_card.dart';
import 'add_employee_screen.dart';
import 'edit_employee_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          /// HEADER
          Text(
            "Welcome Admin 👋",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 4),

          const Text(
            "Manage employees and tasks efficiently",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          /// OVERVIEW CARDS
          GridView.count(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.15,

            children: [

              OverviewCard(
                icon: Icons.groups,
                value: EmployeeService
                    .employees.length
                    .toString(),
                title: "Employees",
                subtitle: "Active Staff",
                color: Colors.blue,
              ),

              const OverviewCard(
                icon: Icons.assignment,
                value: "145",
                title: "Tasks",
                subtitle: "Assigned Tasks",
                color: Colors.green,
              ),

              const OverviewCard(
                icon: Icons.check_circle,
                value: "120",
                title: "Completed",
                subtitle: "Finished Tasks",
                color: Colors.orange,
              ),

              const OverviewCard(
                icon: Icons.notifications_active,
                value: "7",
                title: "Alerts",
                subtitle: "Pending Alerts",
                color: Colors.red,
              ),
            ],
          ),

          const SizedBox(height: 30),

          /// TASK SUMMARY
          Text(
            "Task Summary",
            style:
                Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16),
            ),

            child: const Padding(
              padding: EdgeInsets.all(12),

              child: Column(
                children: [

                  ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    title: Text("Completed"),
                    trailing: Text("120"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.pending,
                      color: Colors.orange,
                    ),
                    title: Text("Pending"),
                    trailing: Text("15"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.directions_walk,
                      color: Colors.blue,
                    ),
                    title: Text("On The Way"),
                    trailing: Text("7"),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// EMPLOYEE MANAGEMENT
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Text(
                "Employee Management",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge,
              ),

              TextButton(
                onPressed: () {},
                child: const Text("View All"),
              ),
            ],
          ),

          const SizedBox(height: 10),

          ...EmployeeService.employees.map(
            (employee) => EmployeeCard(
              employee: employee,

              onEdit: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        EditEmployeeScreen(
                      employee: employee,
                    ),
                  ),
                );

                setState(() {});
              },

              onDelete: () {
                showDialog(
                  context: context,

                  builder: (_) => AlertDialog(
                    title:
                        const Text("Delete Employee"),

                    content: const Text(
                      "Are you sure you want to delete this employee?",
                    ),

                    actions: [

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),

                      ElevatedButton(
                        onPressed: () {

                          setState(() {
                            EmployeeService
                                .employees
                                .remove(employee);
                          });

                          Navigator.pop(context);
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          /// QUICK ACTIONS
          Text(
            "Quick Actions",
            style:
                Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: ActionCard(
                  icon: Icons.person_add,
                  title: "Add Employee",
                  color: Colors.blue,

                  onTap: () async {

                    final employee =
                        await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const AddEmployeeScreen(),
                      ),
                    );

                    if (employee != null) {
                      setState(() {
                        EmployeeService
                            .employees
                            .add(employee);
                      });
                    }
                  },
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ActionCard(
                  icon: Icons.description,
                  title: "Reports",
                  color: Colors.green,
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content:
                            Text("Reports clicked"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          /// RECENT ACTIVITY
          Text(
            "Recent Activity",
            style:
                Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: const [

                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person_add),
                  ),
                  title: Text(
                    "New employee added",
                  ),
                  subtitle:
                      Text("5 minutes ago"),
                ),

                Divider(height: 1),

                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.assignment_turned_in,
                    ),
                  ),
                  title: Text(
                    "Task completed",
                  ),
                  subtitle:
                      Text("20 minutes ago"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}