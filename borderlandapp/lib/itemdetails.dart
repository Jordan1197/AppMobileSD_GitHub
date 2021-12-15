import 'package:flutter/material.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/navdraw.dart';
import 'package:borderlandapp/model/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const ItemDetails(),
    );
  }
}

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ItemDetails> createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    Item i = ModalRoute.of(context)!.settings.arguments as Item;

    var name = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: i.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ]),
          textAlign: TextAlign.start,
        ));

    final descriptionheader = Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Information',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    var redtext = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          i.redText,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ));
    var description = Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 40),
        child: Text(
          "The " +
              i.name +
              " is a " +
              i.rarity.name +
              " " +
              i.type.name +
              " manufactured by " +
              i.manufacturer.name,
          textAlign: TextAlign.start,
        ));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: ListView(
          children: [
            Center(
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
                          child: Image.network(
                        i.imagePath,
                        fit: BoxFit.fill,
                      )),
                      descriptionheader,
                      redtext,
                      description,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
