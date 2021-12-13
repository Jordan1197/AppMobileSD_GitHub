import 'package:flutter/material.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/NavDraw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ennemies Details',
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
      home: const EnnemyDetails(),
    );
  }
}

class EnnemyDetails extends StatefulWidget {
  const EnnemyDetails({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<EnnemyDetails> createState() => EnnemyDetailsState();
}

class EnnemyDetailsState extends State<EnnemyDetails> {
  @override
  Widget build(BuildContext context) {
    const name = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: Text(
          "Monster Name",
          textAlign: TextAlign.start,
        ));

    final descriptionheader = Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Infos',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const description = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          "Desc",
          textAlign: TextAlign.start,
        ));

    final typeheader = Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Type',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const type = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          "Creature",
          textAlign: TextAlign.start,
        ));

    final statusheader = Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Status',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const status = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          "pup",
          textAlign: TextAlign.start,
        ));

    final weakpointheader = Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Weak Point',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const weakpoint = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          "Head",
          textAlign: TextAlign.center,
        ));

    final dropheader = Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Drop',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const drop = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          "Money",
          textAlign: TextAlign.start,
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
                name,
                SizedBox(
                    child: Image.asset(
                  "assets/bl3logo.png",
                  fit: BoxFit.contain,
                )),
                descriptionheader,
                description,
                typeheader,
                type,
                statusheader,
                status,
                weakpointheader,
                weakpoint,
                dropheader,
                drop,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
