class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardlength = 9;

  static final blocksize = 100.0;

  //creating empty blocks

  List<String> board = [];

  static List<String> initGameboard() =>
      List.generate(boardlength, (index) => Player.empty);
}
