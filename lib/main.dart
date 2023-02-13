import 'package:bmi_calculator/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: const Test(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  "BMI ",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Weight (in Kg)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your height (in Feet)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your height (in Inch)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (ift * 12) + iInch;
                        var tCM = tInch * 2.54;
                        var tM = tCM / 100;

                        var bmi = iwt / (tM * tM);

                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are Overweight!!";
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are Under Weight!!";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = "You are Healthy !!";
                          bgColor = Colors.green.shade200;
                        }
                        setState(() {
                          result =
                              "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required Blanks!!";
                        });
                      }
                    },
                    child: const Text("Calculate")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
