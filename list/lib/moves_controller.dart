import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'moves.dart';

class MovesController extends GetxController {
  Rx<List<MovesRepresentation>> moves = Rx<List<MovesRepresentation>>([]);
  RxInt number = 0.obs;
  TextEditingController whiteText = TextEditingController();
  TextEditingController blackText = TextEditingController();
  TextEditingController idText = TextEditingController();

  late MovesRepresentation tmp;

  addNewMove(int id, String whiteMove, String blackMove) {
    tmp = MovesRepresentation(
        id: id + 1, whiteMove: whiteMove, blackMove: blackMove);
    moves.value.add(tmp);
    number.value = moves.value.length;
    whiteText.clear();
    blackText.clear();
  }
}
