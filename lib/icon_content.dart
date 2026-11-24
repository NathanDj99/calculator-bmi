import 'package:flutter/material.dart';



class RewindColumn extends StatelessWidget {
  const RewindColumn({super.key, required this.icon, required this.gender});
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),),
      ],
    );
  }
}
