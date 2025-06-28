import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Image.asset(icon, width: 25, height: 25),
          title: Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ),
    );
  }
}
