import 'package:flutter/material.dart';
import 'moves_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final MovesController movesController = Get.put(MovesController());

  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess list'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: movesController.whiteText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "White",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: movesController.blackText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Black",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                movesController.addNewMove(
                    movesController.number.value,
                    movesController.whiteText.text,
                    movesController.blackText.text);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Add"),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: movesController.number.value,
                    itemBuilder: ((context, index) {
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
                                '${(movesController.moves.value[index].id)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
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
                                '${movesController.moves.value[index].whiteMove}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
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
                                '${movesController.moves.value[index].blackMove}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            )
                            //Text(movesController.moves.value[index].whiteMove),
                            //Text(movesController.moves.value[index].blackMove),
                          ],
                        ),
                      );
                    }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
