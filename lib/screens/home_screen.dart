import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/widgets/custom_container.dart';
import 'package:bmi/widgets/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String male = "Male";
  final String female = "Female";
  bool? ismale;
  double currentheight = 1.6;
  int age = 18;
  int weight = 65;
  String? healthness;
  String websiteUrl = "";
  void whosSelected(bool isMale) {
    setState(() {
      ismale = isMale;
    });
  }

  void increaseAge() {
    setState(() {
      age += 1;
    });
  }

  void decreaseAge() {
    setState(() {
      age -= 1;
    });
  }

  void increaseWeight() {
    setState(() {
      weight += 1;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight -= 1;
    });
  }

  double bmi = 0.0;

  void bmiCalc() {
    bmi = weight / (currentheight * currentheight);
    if (bmi < 18.5) {
      setState(() {
        healthness = "Under Weight";
        websiteUrl = "https://www.mayoclinic.org/";
      });
    } else if (bmi <= 24.9 && bmi >= 18.5) {
      setState(() {
        healthness = "Normal";
      });
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      setState(() {
        healthness = "Over Weight";
        websiteUrl = "https://www.webmd.com/";
      });
    } else {
      setState(() {
        healthness = "Obse";
        websiteUrl = "https://www.nhlbi.nih.gov/";
      });
    }
    if (healthness == null || ismale == null) {
      showToast(
        'Missing fields one of the required field is empty',
        context: context,
        backgroundColor: Colors.teal,
        textStyle: TextStyle(fontSize: 21,color: Colors.white),
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ResultScreen(
                gender: ismale! ? "Male" : "Female",
                age: age.toString(),
                height: currentheight.toStringAsFixed(1),
                weight: weight.toString(),
                healthness: healthness!,
                websiteUrl: websiteUrl,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GenderWidget(
                        gender: male,
                        color:
                            ismale == null
                                ? Colors.blueGrey
                                : ismale!
                                ? Colors.teal
                                : Colors.blueGrey,
                        onTap: (ismale) => whosSelected(ismale),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GenderWidget(
                        gender: female,
                        color:
                            ismale == null
                                ? Colors.blueGrey
                                : ismale!
                                ? Colors.blueGrey
                                : Colors.teal,
                        onTap: (ismale) => whosSelected(ismale),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Text(
                          "Height",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                        trailing: Text(
                          currentheight.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Slider(
                        activeColor: Colors.teal,
                        value: currentheight,
                        max: 2,
                        min: 1,
                        onChanged: (value) {
                          setState(() {
                            currentheight = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      sectionName: "age",
                      mathmaticalvariable: age,
                      decreaseontap: decreaseAge,
                      increaseontap: increaseAge,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CustomContainer(
                      sectionName: "weight",
                      mathmaticalvariable: weight,
                      decreaseontap: decreaseWeight,
                      increaseontap: increaseWeight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: bmiCalc,
                  child: const Text(
                    "Calculate",
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
}
