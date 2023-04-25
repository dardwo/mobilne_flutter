import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

import 'package:proba/moves_page.dart';
import 'package:proba/chess_controller.dart';

void main() {
  runApp(GetMaterialApp(home: HomePage()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final ChessController chessController1 = Get.put(ChessController(), tag: 'board1');
  final ChessController chessController2 = Get.put(ChessController(), tag: 'board2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess game'),
        centerTitle: true,
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => ChessBoard(
                            controller: 
                            ChessBoardController.fromFEN(chessController1.getFen().toString()),
                            boardColor: BoardColor.brown,
                            boardOrientation: PlayerColor.black,
                            ),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(SecondScreen(board_number: 'board1',));
                      },
                      child: const Text("Add FEN")),
                  ],
                ),),
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => ChessBoard(
                            controller: 
                            ChessBoardController.fromFEN(chessController2.getFen().toString()),
                            boardColor: BoardColor.orange,
                            boardOrientation: PlayerColor.white),
                            ),
                    ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(SecondScreen(board_number: 'board2',));
                            },
                            child: const Text("Add FEN")),
                  ],
                ),)
              ],
            ),
        ],),
      ),);
  }
}