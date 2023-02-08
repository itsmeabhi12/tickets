import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String count;
  const TicketCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    const spacer10 = SizedBox(height: 10);
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          spacer10,
          Text(title),
          spacer10,
          Text(count),
        ],
      ),
    );
  }
}
