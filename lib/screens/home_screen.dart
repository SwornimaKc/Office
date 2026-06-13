import 'package:flutter/material.dart';
import 'package:tmobile_app/screens/dashboard/action_card.dart';
import 'package:tmobile_app/screens/dashboard/employee_details.dart';
import 'dashboard/task_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController =
      TextEditingController();

  String searchQuery = "";
  bool isSearching = false;

  final List<Map<String, String>> employees = [
    {
      "name": "Ramesh Kumar",
      "designation": "Senior Assistant",
      "room": "Room 101",
    },
    {
      "name": "Sunita Sharma",
      "designation": "Section Officer",
      "room": "Room 102",
    },
    {
      "name": "Vikram Singh",
      "designation": "Assistant",
      "room": "Room 103",
    },
  ];

  void openTask(
    BuildContext context,
    String taskName,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskHistoryScreen(
          taskTitle: taskName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = employees.where((employee) {
      return employee["name"]!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    final displayedEmployees = searchQuery.isEmpty
        ? employees
        : suggestions;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// SEARCH BAR
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                          isSearching =
                              value.trim().isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search employee...",
                        prefixIcon:
                            const Icon(Icons.search),

                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon:
                                    const Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    searchController.clear();
                                    searchQuery = "";
                                    isSearching = false;
                                  });
                                },
                              )
                            : null,

                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),

                        enabledBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),

                    /// SEARCH SUGGESTIONS
                    if (isSearching)
                      Container(
                        margin:
                            const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        constraints:
                            const BoxConstraints(
                          maxHeight: 250,
                        ),
                        child: suggestions.isEmpty
                            ? const Padding(
                                padding:
                                    EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    "No employee found",
                                    style: TextStyle(
                                      color:
                                          Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    suggestions.length,
                                itemBuilder:
                                    (context, index) {
                                  final employee =
                                      suggestions[index];

                                  return ListTile(
                                    leading:
                                        const Icon(
                                      Icons.search,
                                      color:
                                          Colors.grey,
                                    ),
                                    title: Text(
                                      employee["name"]!,
                                    ),
                                    subtitle: Text(
                                      employee[
                                          "designation"]!,
                                    ),
                                    trailing:
                                        const Icon(
                                      Icons
                                          .north_west,
                                      size: 18,
                                      color:
                                          Colors.grey,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        searchController
                                                .text =
                                            employee[
                                                "name"]!;

                                        searchQuery =
                                            employee[
                                                "name"]!;

                                        isSearching =
                                            false;
                                      });
                                    },
                                  );
                                },
                              ),
                      ),
                  ],
                ),
              ),

              /// HIDE EVERYTHING WHILE SEARCHING
              if (!isSearching) ...[
                /// QUICK ACTIONS
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection:
                        Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    children: [
                      QuickActionCard(
                        icon: Image.asset(
                          'assets/images/folder.png',
                          width: 40,
                          height: 40,
                        ),
                        title: "Bring File",
                        onTap: () => openTask(
                          context,
                          "Bring File",
                        ),
                      ),
                      QuickActionCard(
                        icon: Image.asset(
                          'assets/images/tea.png',
                          width: 50,
                          height: 40,
                        ),
                        title: "Prepare Tea",
                        onTap: () => openTask(
                          context,
                          "Prepare Tea",
                        ),
                      ),
                      QuickActionCard(
                        icon: Image.asset(
                          'assets/images/meetingg.png',
                          width: 60,
                          height: 55,
                        ),
                        title: "Urgent Meeting",
                        onTap: () => openTask(
                          context,
                          "Urgent Meeting",
                        ),
                      ),
                      QuickActionCard(
                        icon: Image.asset(
                          'assets/images/manrun.png',
                          width: 45,
                          height: 40,
                        ),
                        title: "Come now",
                        onTap: () => openTask(
                          context,
                          "Come now",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// EMPLOYEE LIST
                displayedEmployees.isEmpty
                    ? const Padding(
                        padding:
                            EdgeInsets.all(30),
                        child: Text(
                          "No employee found",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemCount:
                            displayedEmployees.length,
                        itemBuilder:
                            (context, index) {
                          final employee =
                              displayedEmployees[
                                  index];

                          return EmployeeCard(
                            name:
                                employee["name"]!,
                            designation: employee[
                                "designation"]!,
                            room:
                                employee["room"]!,
                          );
                        },
                      ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}