// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin notifications =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     const initializationSettings = InitializationSettings(
//       android: AndroidInitializationSettings(
//         '@mipmap/ic_launcher',
//       ),
//     );

//    await notifications.initialize(settings: initializationSettings);
//   }

//   static Future<void> showNotification({
//     required String title,
//     required String body,
//   }) async {
//     const notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'officer_channel',
//         'Officer Assistant',
//         channelDescription: 'Task notifications',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//     );

//     await notifications.show(
//       id: 0,
//       title: title,
//       body: body,
//       notificationDetails: notificationDetails,
//     );
//   }
// }