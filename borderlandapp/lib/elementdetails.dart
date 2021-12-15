import 'package:flutter/material.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/navdraw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Element Details',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ElementDetails(),
    );
  }
}

class ElementDetails extends StatefulWidget {
  const ElementDetails({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ElementDetails> createState() => ElementDetailsState();
}

class ElementDetailsState extends State<ElementDetails> {
  @override
  Widget build(BuildContext context) {
    const title = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: Text(
          "Elements",
          textAlign: TextAlign.start,
        ));

    final element = Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 400.0,
              child: Image.asset(
                "assets/discordlogo.png",
                fit: BoxFit.contain,
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(' '),
          ),
         Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Text(
          "Desc",
          textAlign: TextAlign.start,
        )),
        ],
      ),
    );

    final elementheader = Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Cryo',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title,               
                elementheader,
                element,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
