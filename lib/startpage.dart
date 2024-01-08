import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictoc/homepage.dart';

class startpage extends StatefulWidget {
  const startpage({super.key});

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  var player1 = "";
  var player2 = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player1 = "";
    player2 = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tic Tac Toe",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            TextField(
              controller: name1,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person),
                hintText: "Player 1 name",
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
            TextField(
              controller: name2,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person),
                hintText: "Player 2 name",
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  player1 = name1.text.trim();
                  player2 = name2.text.trim();
                });

                if (player1.isNotEmpty && player2.isNotEmpty) {
                  Get.to(() => HomePage(player1, player2));
                }
              },
              child: Text("Play"),
            )
          ],
        ),
      ),
    );
  }
}
