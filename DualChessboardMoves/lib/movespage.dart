import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'moves_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChessBoardMovesController>(
      () => ChessBoardMovesController("board1"),
      tag: "board1",
    );

    Get.lazyPut<ChessBoardMovesController>(
      () => ChessBoardMovesController("board2"),
      tag: "board2",
    );
  }
}

class MovesPage extends StatelessWidget {
  final String tag;
  final ChessBoardMovesController controller;

  MovesPage({required this.tag})
      : controller = Get.find<ChessBoardMovesController>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Moves Page')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.whiteTextEditingController,
                    decoration: const InputDecoration(
                      hintText: "WhiteMove",
                      labelText: "WhiteMove",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.blackTextEditingController,
                    decoration: const InputDecoration(
                      hintText: "BlackMove",
                      labelText: "BlackMove",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addMoves(
                        controller.itemCount.value,
                        controller.whiteTextEditingController.text,
                        controller.blackTextEditingController.text,
                      );
                      Get.back();
                    },
                    child: const Text("Add"),
                  ),
                ),
              ],
            )));
  }
}
