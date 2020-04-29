import 'package:flutter/material.dart';
import 'dart:math';
//This is a simple app showing some background images, About Me information and some resume info.
//Its purpose is to raise awareness of my existence and my work as a dev.
//Navigation is done using the icon images and the back arrows to return 'home'.

//Here I create the app and the four  pages; home, about us, "resume page" and a randomized dice game.

void main() {
  runApp(new MaterialApp(
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => HomePage(),
        "/AboutUs": (BuildContext context) => AboutUs(),
        "/ResumePage": (BuildContext context) => ResumePage(),
        "/DicePage": (BuildContext context) => DicePage()
      }));
}

//This is the home page area. I used Flutter documentation to determine how to style the text the way I wanted
//Using "Rich Text".
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Home"), backgroundColor: Colors.blueGrey),
        body: new Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/image.jpg'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            child: new Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  //creates the first red icon
                  IconButton(
                      icon: new Icon(Icons.question_answer, color: Colors.red),
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/AboutUs");
                      }),
                  //creates the second blue icon
                  RichText(
                    text: TextSpan(
                      text: 'Click the red ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'icon',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' to go to the about me page!'),
                      ],
                    ),
                  ),

                  IconButton(
                      icon: new Icon(Icons.videogame_asset,
                          color: Colors.deepOrange),
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/DicePage");
                      }),
                  RichText(
                    text: TextSpan(
                      text: 'Click the orange ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'icon',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' to go to the dice game!'),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: new Icon(Icons.looks_two, color: Colors.blueAccent),
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/ResumePage");
                      }),
                  RichText(
                    text: TextSpan(
                      text: 'Click the blue ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'icon',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' to go to the resume page!'),
                      ],
                    ),
                  ),
                  Text(
                    'Aaron Hawkins 2019',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber,
                    ),
                  ),
                ]))));
  }
}

//The about us page.
class AboutUs extends StatelessWidget {
  String myText = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("About Us"), backgroundColor: Colors.blue),
        body: new Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/bg2.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      iconSize: 80.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/HomePage");
                      }),
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '\nAaron Hawkins is a fledgling web developer from Columbia Falls, MT.' +
                        ' He is 24 years old and likes video games, reading and sleeping',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue,
                    ),
                  ),
                ]))));
  }
}

//The 'resume page' with some more info about Aaron.
class ResumePage extends StatelessWidget {
  String myText = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Resume Page"), backgroundColor: Colors.green),
        body: new Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/bg3.jpg'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      iconSize: 70.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/HomePage");
                      }),
                  Text(
                    'Aaron works at Mountain View Hearth Products where he is an intern and data entry processor. \n' +
                        'During the summer, he works at Glacier Ziplines in Columbia Falls.',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ]))));
  }
}

//down here is my stateful widget, a simple randomized dice game. I used a tutorial by Angela Yu from Udemy to make this.
//It uses Expanded to fill up the entire screen with the dice, so you have to use the back button on your phone.
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset(
                'assets/dice$leftDiceNumber.png',
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset(
                'assets/dice$rightDiceNumber.png',
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
        ],
      ),
    );
  }
}
