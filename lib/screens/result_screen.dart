import 'package:bmi/screens/landscape_result_scrreen.dart';
import 'package:bmi/widgets/custom_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.healthness,
    required this.websiteUrl,
  });
  final String gender;
  final String age;
  final String height;
  final String weight;
  final String healthness;
  final String websiteUrl;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (Orientation.landscape == orientation) {
          return LandScapeResultScreen(
            gender: gender,
            age: age,
            height: height,
            weight: weight,
            healthness: healthness,
            websiteUrl: websiteUrl,
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 35),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          " BMI Result",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 65),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomResultItem(
                            itemName: "Gender",
                            itemResult: gender,
                          ),
                          const SizedBox(height: 15),
                          CustomResultItem(itemName: "Age", itemResult: age),
                          const SizedBox(height: 15),
                          CustomResultItem(
                            itemName: "Height",
                            itemResult: height,
                          ),
                          const SizedBox(height: 15),
                          CustomResultItem(
                            itemName: "Weight",
                            itemResult: weight,
                          ),
                          const SizedBox(height: 15),
                          CustomResultItem(
                            itemName: "Healthness",
                            itemResult: healthness,
                          ),
                        ],
                      ),
                    ),

                    if (healthness != "Normal")
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            final url = Uri.parse(websiteUrl);

                            try {
                              await launchUrl(url);
                            } catch (e) {
                              showToast(
                                "Sorry url was broken, please try later!",
                                // ignore: use_build_context_synchronously
                                context: context,
                                backgroundColor: Colors.teal,
                                textStyle: TextStyle(fontSize: 21),
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: Duration(seconds: 1),
                                duration: Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.linear,
                              );
                            }
                          },
                          child: const Text(
                            "Start Now",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
