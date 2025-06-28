import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final Color subtitleColor;

  const TransactionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white10,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: subtitleColor)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          Text(date,
              style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }
}
