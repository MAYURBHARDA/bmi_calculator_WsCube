import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var bmi;
  var bgColor = Colors.indigo.shade200;
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Weight (in Kg)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Height (in Feet)"),
                    prefixIcon: Icon(Icons.scale),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Height (in Inch)"),
                    prefixIcon: Icon(Icons.scale),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iWT = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var msg = "";

                        var tInch = (iFt * 12) + iInch;
                        var tCM = (tInch * 2.54);
                        var tM = tCM / 100;

                        var bmi = iWT / (tM * tM);

                        if (bmi > 25) {
                          msg = " You are OverWeight!!";
                          bgColor = Colors.red.shade200;
                        } else if (bmi < 18) {
                          msg = "You are UnderWeight !!";
                          bgColor = Colors.amber.shade200;
                        } else {
                          msg = "You are Healthy!!";
                          bgColor = Colors.green;
                        }
                        setState(() {
                          result = "Your BMI is : ${bmi.toStringAsFixed(2)} "
                              "\n  $msg";
                        });
                      } else {
                        result = "Please fill all the blank Field !!";
                      }
                    },
                    child: const Text("Calculate")),
                const SizedBox(height: 10),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
