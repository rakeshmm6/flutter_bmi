import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolor = const Color.fromARGB(255, 247, 219, 252);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Container(
          color: bgcolor,
          child: Column(children: [
            Center(
              child: Text(
                "BMI",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: wtcontroller,
                decoration: InputDecoration(
                  labelText: "Weight in kgs",
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ftcontroller,
                decoration: InputDecoration(
                  label: Text("Height in feet"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: incontroller,
                decoration: InputDecoration(
                  label: Text("Height in inches"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.blue.shade100)),
                onPressed: () {
                  var wt = int.parse(wtcontroller.text.toString());
                  var ft = int.parse(ftcontroller.text.toString());
                  var inch = int.parse(incontroller.text.toString());

                  if (wt != "" && ft != "" && inch != "") {
                    var ftincm = (ft * 12) + ft;
                    var incm = ftincm * 2.54;
                    var finalht = incm / 100;
                    var bmi = (wt / (finalht * finalht));
                    var msg = "";

                    if (bmi > 25) {
                      msg = "You are Overweight!!";
                      bgcolor = Colors.red.shade200;
                    } else if (bmi < 18.5) {
                      msg = "You are Underweight";
                      bgcolor = Colors.orange.shade200;
                    } else {
                      msg = "You are healthy ";
                      bgcolor = Colors.greenAccent.shade200;
                    }

                    setState(() {
                      result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please enter all the values";
                    });
                  }
                },
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            )
          ]),
        ));
  }
}
