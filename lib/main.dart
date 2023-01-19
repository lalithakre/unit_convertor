// import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var input, from, to, result;
    var measures = ['centimeter', 'meter', 'milimeter'];
    var measuremap = {'centimeter': 0, 'meter': 1, 'milimeter': 1};
    var formula = {
      'cantimeter': [1, .01, .001],
      'meter': [100, 1, 1000],
      'milimeter': [.01, .001, 1]
    };
    void convert(input, from, to) {
      var mul = formula[from]![measuremap[to]!];
      setState(() {
        result = input * mul;
      });
    }

    var variable;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Unit Convertor App")),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Enter the value for unit conversion"),
            SizedBox(height: 10),
            TextField(
                decoration: InputDecoration(hintText: 'Enter value'),
                onChanged: (value) => {input = double.tryParse(value)}),
            SizedBox(height: 10),
            Text('From'),
            DropdownButton(
                items: measures.map((x) {
                  return (DropdownMenuItem(child: Text(x), value: x));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    from = value;
                  });
                },
                value: from),
            SizedBox(height: 10),
            Text('To'),
            SizedBox(height: 10),
            DropdownButton(
                items: measures.map((x) {
                  return (DropdownMenuItem(child: Text(x), value: x));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    to = value;
                  });
                },
                value: to),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (from.isEmpty || to.isEmpty || input == 0) {
                    return;
                  } else {
                    convert(input, from, to);
                  }
                },
                child: Text('Convert')),
            SizedBox(height: 10),
            Text("Converted value is ${result}"),
          ],
        )),
      ),
    );
    // home: const MyHomePage(title: 'Flutter Demo Home Page'),
  }
}


/*

 return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'Unit Convertor Apllication',
          style: TextStyle(fontSize: 25),
        )),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 400,
              height: 0,
            ),
            DropdownButton(
              items: val.map((x) {
                return (DropdownMenuItem(
                  child: Text(measures[x]),
                  value: x,
                ));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  variable = value;
                });
              },
            ),
            Text("Selected value is ${variable}")
          ],
        ),
      ),
    );

    */