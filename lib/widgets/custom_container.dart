import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.sectionName,required this.mathmaticalvariable,required this.decreaseontap,required this.increaseontap});
final int mathmaticalvariable;
final String sectionName;
final void Function() increaseontap;
final void Function() decreaseontap;
  @override
  Widget build(BuildContext context) {
    return  Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                     Text(
                      sectionName,
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("$mathmaticalvariable",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: increaseontap,
                            icon: const Icon(
                              Icons.add_circle_rounded,
                              size: 52,
                              color: Colors.teal,
                            )),
                        IconButton(
                            onPressed: decreaseontap,
                            icon: const Icon(
                              Icons.remove_circle_sharp,
                              size: 52,
                              color: Colors.teal,
                            )),
                      ],
                    )
                  ],
                ),
              );
  }
}