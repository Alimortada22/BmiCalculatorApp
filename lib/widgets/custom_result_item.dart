import 'package:flutter/material.dart';

class CustomResultItem extends StatelessWidget {
  const CustomResultItem({super.key,required this.itemName,required this.itemResult});
final String itemName;
final String itemResult;
  @override
  Widget build(BuildContext context) {
    return RichText(
                      text:   TextSpan(
                    text: " $itemName: ",
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                    text: itemResult,
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),)
                        ]
                  ));
  }
}