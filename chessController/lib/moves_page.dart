import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:proba/chess_controller.dart';

class SecondScreen extends StatelessWidget {
  final String board_number;
  SecondScreen({required this.board_number});

  List<String> BoardList = [
      'r3k2r/ppp1bppp/2np4/4q3/4P3/2N1B3/PPPP1PPP/R2QKB1R w KQkq - 0 1',
      'r1b1k2r/p1ppqppp/2n2n2/1p2p3/4P3/1NN1BP2/PPPQ2PP/2KR1B1R w kq - 0 1',
      '1r1q1rk1/p1p1bppp/2p2n2/8/3PN3/P2Q1N2/1PP2PPP/R1B2RK1 b - - 0 1',
      '8/1p6/1pp1k3/p3p3/P3P3/2P5/1K1P4/8 w - - 0 1',
      '2kr4/p2b2p1/1p1p1p2/2n2P2/2PpP3/1P1N1K2/P1R1B1PP/8 b - - 0 1',
      'r2qkb1r/ppp2ppp/2np1n2/2b1p3/4P3/1NN1BP2/PPP1B1PP/R2QKB1R b KQkq - 0 1',
      'r1b1k2r/pppp1ppp/2n2n2/4p3/4P3/1NN1B3/PPP1BPPP/R2QK2R b KQkq - 0 1',
      '4k3/1p6/1p6/8/1P6/8/2PK4/8 w - - 0 1',
      '8/3k4/8/2P5/8/2K5/8/8 b - - 0 1',
      'rnbqkbnr/ppp1pppp/3p4/8/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1',
    ];

  @override
  Widget build(BuildContext context) {
    final ChessController chessController = Get.find<ChessController>(tag: board_number);
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = chessController.getFen().toString();

    return Scaffold(
        appBar: AppBar(
          title: Text('Chess Board $board_number'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: "FEN",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        chessController.updateFen(textEditingController.text);
                        Get.back();
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        chessController.updateFen(BoardList[Random().nextInt(BoardList.length).toInt()]);
                        Get.back();
                      },
                      child: const Text("Random FEN"),
                    ),
                  ),
                ),
              ],
            )
          )
        );
  }
}