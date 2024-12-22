import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NotificationCard(
              title: "Trip confirmed",
              description: "Waseem Javed is on his way to pick you up!",
              time: "1m ago",
              buttonLabel: "Check Ride Details",
              buttonColor: Colors.green,
              iconColor: Colors.green.shade200,
              icon: Icons.check_circle,
              onButtonPressed: () {
                context.pushNamed('ride-details'); // Navigates to ride details
              },
            ),
            const SizedBox(height: 16),
            NotificationCard(
              title: "Trip confirmation",
              description:
                  "We have received your trip request.\nWe will confirm your trip shortly.",
              time: "1h ago",
              buttonLabel: "Cancel Trip",
              buttonColor: Colors.grey.shade300,
              iconColor: Colors.orange.shade100,
              icon: Icons.check_circle_outline,
              onButtonPressed: () {
                _showCancellationReasons(context); // Opens the bottom sheet
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCancellationReasons(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reason for Cancellation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            _buildReasonOption(context, "Need to go to different location"),
            _buildReasonOption(context, "Timing does not work"),
            _buildReasonOption(context, "My plans changed"),
            _buildReasonOption(context, "Other"),
          ],
        ),
      );
    },
  );
}
  Widget _buildReasonOption(BuildContext context, String reason) {
  return ListTile(
    title: Text(reason),
    onTap: () {
      Navigator.pop(context); // Close the bottom sheet
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cancellation reason: $reason")),
        );
      },
    );
  }
}


class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String buttonLabel;
  final Color buttonColor;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onButtonPressed;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.buttonLabel,
    required this.buttonColor,
    required this.iconColor,
    required this.icon,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onButtonPressed,
              child: Text(
                buttonLabel,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
