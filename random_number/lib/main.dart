import 'package:flutter/material.dart';
import 'dart:math';
import 'package:random_number/Number.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final TextEditingController _numberController = TextEditingController();

  int value = Random().nextInt(100) + 0;
  int tmp = 0;
  bool isPressed = false;
  final List<Number> numbers = [
    //Number(id: '1', num: 0, description: 'Not enough'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add a number',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: isPressed
                        ? null
                        : () {
                            print('Check');
                            print(_numberController.text);
                            tmp = int.tryParse(_numberController.text) ?? 0;
                            setState(() {
                              numbers.add(Number(
                                  id: '1',
                                  num:
                                      int.tryParse(_numberController.text) ?? 0,
                                  description: (tmp > value)
                                      ? 'Za duzo'
                                      : (tmp < value)
                                          ? 'Za malo'
                                          : 'Trafiłeś!'));
                            });
                            (value == tmp) ? isPressed = true : null;
                            tmp = 0;
                            _numberController.clear();
                          },
                    child: Text('Check'),
                  ),
                ),
              ],
            )),
            ...numbers.reversed.map((e) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${e.num}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('${e.description}')),
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        ));
  }
}
