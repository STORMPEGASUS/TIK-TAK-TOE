import 'package:demo_app/ui/theme/color.dart';
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

  @override
  Widget build(BuildContext context) {
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

          ),
        ],
      ),
    );
  }
}
