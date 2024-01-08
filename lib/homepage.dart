import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final player1;
  final player2;
  const HomePage(String this.player1, String this.player2, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool iscross = true;
  late List<String> gameState;
  String message = "";
  // Set image on variable to change on click
  AssetImage edit = AssetImage("images/edit.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage currentimage = AssetImage("images/edit.png");
  int count1 = 0, count2 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
      count1 = 0;
      count2 = 0;
    });
  }

//Play Game logic
  void playgame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (iscross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
        iscross = !iscross;
        wingame();
      });
    }
  }

  // Reset the game
  void reset() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
      iscross = true;
      count1 = 0;
      count2 = 0;
    });
  }

  void playagain() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
      iscross = true;
    });
  }

  // Get images
  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;

      case ('cross'):
        return cross;

      case ('circle'):
        return circle;
    }
  }

  //win logic
  void wingame() {
    if (gameState[0] != 'empty' &&
        gameState[0] == gameState[1] &&
        gameState[1] == gameState[2]) {
      setState(() {
        message = "${gameState[0]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
      });
    } else if (gameState[3] != 'empty' &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]) {
      setState(() {
        message = "${gameState[3]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
        // reset();
      });
    } else if (gameState[6] != 'empty' &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]) {
      setState(() {
        message = "${gameState[6]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
        //reset();
      });
    } else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[3] &&
        gameState[3] == gameState[6]) {
      setState(() {
        message = "${gameState[0]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
        // reset();
      });
    } else if (gameState[1] != 'empty' &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      setState(() {
        message = "${gameState[1]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
        //reset();
      });
    } else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      setState(() {
        message = "${gameState[2]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
        // reset();
      });
    } else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]) {
      setState(() {
        message = "${gameState[0]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
        //reset();
      });
    } else if (gameState[6] != 'empty' &&
        gameState[6] == gameState[4] &&
        gameState[4] == gameState[2]) {
      setState(() {
        message = "${gameState[6]} win";
        if (message == 'cross win') {
          setState(() {
            count2++;
          });
        } else {
          count1++;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var player1 = widget.player1;
    var player2 = widget.player2;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "cross Vs circle",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (context, i) => SizedBox(
              height: 200,
              width: 200,
              child: MaterialButton(
                shape: Border.symmetric(
                    horizontal: BorderSide(color: Colors.red),
                    vertical: BorderSide(color: Colors.green)),
                onPressed: () {
                  playgame(i);
                },
                child: Image(
                  fit: BoxFit.fill,
                  image: getImage(gameState[i]),
                ),
              ),
            ),
          )),
          Row(
            children: [
              Text(
                "${player1}",
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
              Spacer(),
              Text(
                "${player2}",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "$count1",
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
              Spacer(),
              Text(
                "$count2",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            ],
          ),
          Text(
            "$message",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          Row(
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  playagain();
                },
                child: const Text("Play Again"),
              ),
              Spacer(),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  reset();
                },
                child: const Text("Reset"),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class SliverGridDelegateWithFixedcrossAxisCount {
  const SliverGridDelegateWithFixedcrossAxisCount();
}
