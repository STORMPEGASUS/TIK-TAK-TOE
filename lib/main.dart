// ignore_for_file: avoid_print

import 'package:demo_app/ui/theme/color.dart';
import 'package:demo_app/utils/game_logic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //adding the necessary variables
  String lastvalue = "X";
  bool gameOver = false;
  //lets declare  a new game component
  Game game = Game();
  int turn = 0;
  String result = "";
  //score board
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  //lets initialise the game board
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameboard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //the first step is to maintain our project folder structure
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "It's $lastvalue Turn".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 58,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //now we will make the game board
          //but first we will create a game class which will contain all the data and method
          Container(
            width: boardwidth,
            height: boardwidth,
            child: GridView.count(
              crossAxisCount: Game.boardlength ~/
                  3, //this ~operator allows you to evide as integer and return a integer
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(Game.boardlength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          //when we click the area new text has to display and new screen is to be shown
                          //we also need to toggle the player
                          //now we have to apply click only to empty field
                          //now lets create a button to repeat the game
                          if (game.board[index] == "") {
                            setState(() {
                              game.board[index] = lastvalue;
                              turn++;
                              gameOver = game.winnercheck(
                                  lastvalue, index, scoreboard, 3);
                              if (gameOver) {
                                result = "$lastvalue is the winner";
                              } else if (!gameOver && turn == 9) {
                                result = "It's a Draw";
                                gameOver = true;
                              }
                              if (lastvalue == "X") {
                                lastvalue = "O";
                              } else {
                                lastvalue = "X";
                              }
                            });
                          }
                        },
                  child: Container(
                    width: Game.blocksize,
                    height: Game.blocksize,
                    decoration: BoxDecoration(
                      color: MainColor.secondaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        game.board[index],
                        style: TextStyle(
                          color: game.board[index] == "X"
                              ? Colors.blue
                              : Colors.pink,
                          fontSize: 64,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            result,
            style: TextStyle(
              color: Colors.white,
              fontSize: 54,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                //erase the board
                game.board = Game.initGameboard();
                lastvalue = "X";
                gameOver = false;
                turn = 0;
                result = "";
                scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text("Repeat the Game"),
          ),
        ],
      ),
    );
  }
}
