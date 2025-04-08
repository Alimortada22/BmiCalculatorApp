import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key, required this.gender,required this.color,required this.onTap});
  final String gender;
final Color color;
final void Function(bool ismale) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gender=="Male") {
          onTap(true);
        }else{
          onTap(false);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color:color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Icon(
              gender == "Male" ? Icons.male : Icons.female,
              size: 96,
              color: Colors.white,
            ),
            Text(
              gender,
              style: const TextStyle(
                  fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
