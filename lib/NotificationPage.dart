import 'package:flutter/material.dart';

class Notification {
  final String title;
  final String message;

  const Notification({
    required this.title,
    required this.message,
  });
}

const List<Notification> notifications = [
  Notification(
    title: 'new_order_notification',
    message: 'You have a new order!',
  ),
  Notification(
    title: 'order_received_notification',
    message: 'Your order has been received and is being prepared.',
  ),
  // ... add more notifications here
];

class NotificationService {
  static void handleNotificationClick(Notification notification) {
    // Handle notification click
    // You can navigate to a specific screen or perform an action
    print('Notification clicked: ${notification.message}');
  }

  static Widget buildNotificationList() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification.message),
            onTap: () => handleNotificationClick(notification),
          );
        },
      ),
    );
  }
}
