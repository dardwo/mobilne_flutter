import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/moves_model.dart';

class ChessBoardMovesController extends GetxController {
  Rx<List<MovesModel>> moves = Rx<List<MovesModel>>([]);

  TextEditingController whiteTextEditingController = TextEditingController();
  TextEditingController blackTextEditingController = TextEditingController();
  TextEditingController idTextEditingController = TextEditingController();

  late MovesModel movesModel;
  var itemCount = 0.obs;

  final String name;

  ChessBoardMovesController(this.name);

  addMoves(int id, String whiteMove, String blackMove) {
    movesModel = MovesModel(id: id + 1, whiteMove: whiteMove, blackMove: blackMove);
    moves.value.add(movesModel);
    itemCount.value = moves.value.length;
    whiteTextEditingController.clear();
    blackTextEditingController.clear();
  }
}
