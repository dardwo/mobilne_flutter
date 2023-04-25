import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/movespage.dart';
import 'package:newproject/moves_controller.dart';

void main() {
  runApp(GetMaterialApp(home: HomePage()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(ChessBoardMovesController("board1"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess moves'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(MovesPage(tag: "board1"));
                            },
                            child: const Text("Make Move")),
                      ))),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(MovesPage(tag: "board2"));
                            },
                            child: const Text("Make Move")),
                      ))),
            ],
          ),
          Container(
            height: 400,
            child: Row(
              children: [
                Container(
                  child: Expanded(
                    child: GetX<ChessBoardMovesController>(
                        tag: "board1",
                        init: ChessBoardMovesController("board1"),
                        builder: (controller) => ListView.builder(
                              itemCount: controller.itemCount.value,
                              itemBuilder: ((context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${controller.moves.value[index].id}   ${controller.moves.value[index].whiteMove!} ${controller.moves.value[index].blackMove!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                );
                              }),
                            )),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: GetX<ChessBoardMovesController>(
                        tag: "board2",
                        init: ChessBoardMovesController("board2"),
                        builder: (controller) => ListView.builder(
                              itemCount: controller.itemCount.value,
                              itemBuilder: ((context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${controller.moves.value[index].id}   ${controller.moves.value[index].whiteMove!} ${controller.moves.value[index].blackMove!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                );
                              }),
                            )),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
