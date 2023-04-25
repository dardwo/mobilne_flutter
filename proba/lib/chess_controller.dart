import 'package:get/get.dart';

class ChessController extends GetxController {
  RxString FEN = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'.obs;

  void updateFen(String fen) {
   FEN.value = fen;
  }

  RxString getFen() {
    return FEN;
  }
}