import 'package:flutter/material.dart';
import 'package:tmobile_app/screens/home_screen.dart';
import '../constants/app_colors.dart';
import 'admin/admin_screen.dart';
import 'history/history_screen.dart';
import 'notification/notification_home_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [

    // Home Screen
    const HomeScreen(),

    // Notification Screen
    const NotificationHomeScreen(),

    // History Screen
    const HistoryScreen(),
    //Admin Screen

    const AdminScreen(),

    //
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
         backgroundColor: AppColors.primary,
          title: Text(
    currentIndex == 0
        ? "Officer Dashboard"
        : currentIndex == 1
            ? "Notifications"
            : currentIndex == 2
                ? "History"
                : "Admin Portal",
  ),

actions: [

  Padding(
    padding: const EdgeInsets.only(right: 12),

    // child: InkWell(
    //   borderRadius: BorderRadius.circular(30),

    //   onTap: () {


    //   },

    //   child: const CircleAvatar(
    //     backgroundColor: Colors.white,
    //     child: Icon(Icons.person),
    //   ),
    // ),
  ),
],
      ),

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,

        backgroundColor:
            const Color.fromARGB(255, 226, 227, 229),

        currentIndex: currentIndex,

        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.primaryDark,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: "Admin",
          ),
        ],
      ),
    );
  }
}