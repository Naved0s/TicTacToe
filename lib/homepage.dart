import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> display = ['', '', '', '', '', '', '', '', ''];
  bool firstx = true;
  int xscore = 0;
  int oscore = 0;
  int filledboxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff111a3b),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player X',
                            style: GoogleFonts.pressStart2p(
                                color: Colors.white, fontSize: 15),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            xscore.toString(),
                            style: GoogleFonts.pressStart2p(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player O',
                            style: GoogleFonts.pressStart2p(
                                color: Colors.white, fontSize: 15),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            oscore.toString(),
                            style: GoogleFonts.pressStart2p(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                        onTap: () => taped(index),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff4481f1))),
                          child: Center(
                            child: Text(
                              display[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        ));
                  }),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      child: Text('Reset'))
                ],
              ),
            ))
          ],
        ));
  }

  void taped(int index) {
    setState(() {
      if (firstx && display[index] == '') {
        display[index] = 'x';
        filledboxes += 1;
      } else if (!firstx && display[index] == '') {
        display[index] = 'o';
        filledboxes += 1;
      }

      firstx = !firstx;
      check();
    });
  }

  void check() {
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != '') {
      Winner(display[0]);
    } else if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != '') {
      Winner(display[3]);
    } else if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != '') {
      Winner(display[6]);
    } else if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[3] != '') {
      Winner(display[0]);
    } else if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != '') {
      Winner(display[1]);
    } else if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != '') {
      Winner(display[2]);
    } else if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != '') {
      Winner(display[0]);
    } else if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != '') {
      Winner(display[2]);
    } else if (filledboxes == 9) {
      Draw();
    }
  }

  void Draw() {
    void clear() {
      setState(() {
        for (int i = 0; i < 9; i++) {
          display[i] = '';
        }
        filledboxes = 0;
      });
    }

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clear();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again'))
            ],
            title: Text('DRAW'),
          );
        });
  }

  void Winner(String winner) {
    void clear() {
      setState(() {
        for (int i = 0; i < 9; i++) {
          display[i] = '';
        }
        filledboxes = 0;
      });
    }

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clear();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again'))
            ],
            title: Text("Winner is: " + winner),
          );
        });
    if (winner == 'x') {
      xscore += 1;
    } else if (winner == 'o') {
      oscore += 1;
    }
  }

  void reset() {
    setState(() {
      xscore = 0;
      oscore = 0;
      filledboxes = 0;
      for (int i = 0; i < 9; i++) {
        display[i] = '';
      }
    });
  }
}
