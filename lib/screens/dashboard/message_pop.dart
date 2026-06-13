import 'package:flutter/material.dart';

class EmployeeMessagePopup extends StatefulWidget {
  final String employeeName;
  final String designation;
  final String room;

  const EmployeeMessagePopup({
    super.key,
    required this.employeeName,
    required this.designation,
    required this.room,
  });

  @override
  State<EmployeeMessagePopup> createState() =>
      _EmployeeMessagePopupState();
}

class _EmployeeMessagePopupState
    extends State<EmployeeMessagePopup> {
  final TextEditingController messageController =
      TextEditingController();

  String selectedTask = "";

  void selectQuickMessage(String message) {
    setState(() {
      selectedTask = message;
      messageController.text = message;
    });
  }

  Future<void> scheduleReminder() async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (selectedDate == null) return;

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Reminder scheduled on "
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
          " at ${selectedTime.format(context)}",
        ),
      ),
    );
  }

  void repeatNotification() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Repeat Notification"),
        content: Text(
          "Resend notification to ${widget.employeeName}?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Notification resent to ${widget.employeeName}",
                  ),
                ),
              );
            },
            child: const Text("Resend"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// HEADER
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius:
                      BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      // child: Image.asset(
                      //   'assests/man.png',
                      //   width: 50,
                      // ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.employeeName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            widget.designation,
                            style: TextStyle(
                              color:
                                  Colors.grey.shade700,
                            ),
                          ),

                          Text(
                            widget.room,
                            style: TextStyle(
                              color:
                                  Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// QUICK ACTION TITLE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quick Actions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// QUICK ACTIONS
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  buildQuickAction(
                    icon: Image.asset(
                      'assets/images/folder.png',
                      width: 42,
                      height: 42,
                    ),
                    title: "Bring File",
                    onTap: () {
                      selectQuickMessage(
                        "Please bring the required file.",
                      );
                    },
                  ),

                  buildQuickAction(
                    icon: Image.asset(
                      'assets/images/tea.png',
                      width: 42,
                      height: 42,
                    ),
                    title: "Prepare Tea",
                    onTap: () {
                      selectQuickMessage(
                        "Please prepare tea.",
                      );
                    },
                  ),

                  buildQuickAction(
                    icon: Image.asset(
                      'assets/images/meetingg.png',
                      width: 42,
                      height: 42,
                    ),
                    title: "Meeting",
                    onTap: () {
                      selectQuickMessage(
                        "Please report immediately.",
                      );
                    },
                  ),

                  buildQuickAction(
                    icon: Image.asset(
                      'assets/images/manrun.png',
                      width: 42,
                      height: 42,
                    ),
                    title: "Come Now",
                    onTap: () {
                      selectQuickMessage(
                        "Please come immediately.",
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// MESSAGE TITLE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// MESSAGE BOX
              TextField(
                controller: messageController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      "Type your message here...",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// SEND BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (messageController.text
                        .trim()
                        .isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please enter a message",
                          ),
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          "Notification sent to ${widget.employeeName}",
                        ),
                      ),
                    );

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue.shade700,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        16,
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Send Notification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              /// BOTTOM BUTTONS
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: scheduleReminder,
                      icon: const Icon(Icons.alarm),
                      label: const Text(
                        "Schedule Alert",
                        style:
                            TextStyle(fontSize: 12),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed:
                          repeatNotification,
                      icon:
                          const Icon(Icons.repeat),
                      label:
                          const Text("Repeat"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuickAction({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(16),
      child: Container(
        width: 95,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}