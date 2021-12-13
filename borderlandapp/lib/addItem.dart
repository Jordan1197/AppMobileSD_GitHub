import 'package:flutter/material.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/NavDraw.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Items',
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
      home: const MangageItems(title: 'Manage Items'),
    );
  }
}

class MangageItems extends StatefulWidget {
  const MangageItems({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MangageItems> createState() => _MangageItems();
}

class _MangageItems extends State<MangageItems> {
  final nameController = TextEditingController();
  final redTextController = TextEditingController();
  final descriptionController = TextEditingController();
  var picker;
  List<String> options = <String>[
    'Weapon',
    'Shield',
    'Grenade',
    'Artifact',
    'Class Mod'
  ];
  String dropdownValue = 'Weapon';
  List<String> rarity = <String>[
    'Legendary',
    'Epic',
    'Rare',
    'Uncommon',
    'Common'
  ];
  String rarityValue = 'Legendary';
  List<String> ennemy = <String>[
    'Genevieve',
    'Captain Traunt',
    'Hyde/Heckle',
    'Graveward',
    'Lee'
  ];
  String ennemyValue = 'Genevieve';

  @override
  void initState() {
    super.initState();
    picker = new ImagePicker();
  }
  

  @override
  Widget build(BuildContext context) {
    //Title
    final h1 = Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Manage Items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
      ),
    );

    //label Name
    final nameField = Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2,
        child: TextFormField(
          controller: nameController,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Name",
            hintText: "Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ));

    //label RedText
    final redText = Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2,
        child: TextFormField(
          controller: redTextController,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Red Text",
            hintText: "Red Text",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ));

    //label Description
    final description = Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2,
        child: TextFormField(
          controller: descriptionController,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Description",
            hintText: "Description",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ));

    //Label Equipment
    const equipmentLabel = Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Text(
          "Equipment",
          textAlign: TextAlign.center,
        ));
    final equipments = Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2,
        child: DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          style: const TextStyle(color: Colors.blue),
          selectedItemBuilder: (BuildContext context) {
            return options.map((String value) {
              return Text(
                dropdownValue,
                style: const TextStyle(color: Colors.black),
              );
            }).toList();
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));

    //Label Equipment
    const rarityLabel = Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Text(
          "Rarity",
          textAlign: TextAlign.center,
        ));
    final rarities = Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2,
        child: DropdownButton<String>(
          value: rarityValue,
          onChanged: (String? newValue) {
            setState(() {
              rarityValue = newValue!;
            });
          },
          style: const TextStyle(color: Colors.blue),
          selectedItemBuilder: (BuildContext context) {
            return rarity.map((String value) {
              return Text(
                rarityValue,
                style: const TextStyle(color: Colors.black),
              );
            }).toList();
          },
          items: rarity.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));

    //Label Equipment
    const ennemyLabel = Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Text(
          "Ennemy",
          textAlign: TextAlign.center,
        ));
    final ennemies = Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2,
        child: DropdownButton<String>(
          value: ennemyValue,
          onChanged: (String? newValue) {
            setState(() {
              ennemyValue = newValue!;
            });
          },
          style: const TextStyle(color: Colors.blue),
          selectedItemBuilder: (BuildContext context) {
            return ennemy.map((String value) {
              return Text(
                ennemyValue,
                style: const TextStyle(color: Colors.black),
              );
            }).toList();
          },
          items: ennemy.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));

    void _asyncFileUpload(File file) async {
      //create multipart request for POST or PATCH method
      var request = http.MultipartRequest("POST", Uri.parse("<url>"));
      //add text fields
      request.fields["infoconnexion"] =
          "info de connexion"; // le body dans le fond
      //create multipart using filepath, string or bytes
      var pic = await http.MultipartFile.fromPath("file_field", file.path);
      //add multipart to request
      request.files.add(pic);
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);
    }

    final imgbutton = Material(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: 300,
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
          child: Text(
            "Select Image",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            var source = ImageSource.gallery;
            XFile image = await picker.pickImage(
                source: source,
                imageQuality: 50,
                preferredCameraDevice: CameraDevice.front);
            setState(() {
              _asyncFileUpload(File(image.path));
            });
          },
        ));

    final addButton = Material(
      borderRadius: BorderRadius.circular(15.0),
      color: const Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 300,
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
        onPressed: () async {
          postRequest();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MangageItems(title: 'Manage Items')));
        },
        child: const Text(
          "Add",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final cancelButton = Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(15.0),
      color: const Color.fromARGB(0, 0, 0, 0),
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        minWidth: 300,
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Settings()));
        },
        child: const Text(
          "Cancel",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );

    //section navbar
    int _navSelectedIndex = 5;
    const TextStyle navOptionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> NavbarOptions = <Widget>[
      Text(
        'Index 0: Accueil',
        style: navOptionStyle,
      ),
      Text(
        'Index 1: Items',
        style: navOptionStyle,
      ),
      Text(
        'Index 2: Characters',
        style: navOptionStyle,
      ),
      Text(
        'Index 3: Ennemies',
        style: navOptionStyle,
      ),
      Text(
        'Index 4: Other',
        style: navOptionStyle,
      ),
      Text(
        'Index 5: Settings',
        style: navOptionStyle,
      ),
    ];
    //fonction navbar
    final _pageOptions = [
      const Accueil(),
      const ItemList(),
      const CharacterList(),
      const EnnemiesList(title: "Ennemie Liste"),
      const PlanetList(),
      const Settings(),
    ];
    void _onNavBarTap(int index) {
      setState(() {
        _navSelectedIndex = index;

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _pageOptions[index],
            ));
      });
    }

    //fin fonction
    final customNavBar = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/bagicons.png"),
          ),
          label: 'Items',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/person-silhouette.png"),
          ),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/ennemienav.png"),
          ),
          label: 'Ennemies',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/more-information.png"),
          ),
          label: 'Other',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/settings.png"),
          ),
          label: 'Settings',
        ),
      ],
      currentIndex: _navSelectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      onTap: _onNavBarTap,
    );

    //fin navbar

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          mainAxisAlignment: MainAxisAlignment.start, //vertical
          children: <Widget>[
            h1,
            nameField,
            redText,
            description,
            equipmentLabel,
            equipments,
            rarityLabel,
            rarities,
            ennemyLabel,
            ennemies,
            SizedBox(
                  height: 20.0,
                ),
            imgbutton,
            SizedBox(
                  height: 20.0,
                ),
            addButton,
            cancelButton,
          ],
        ),
      ),
      bottomNavigationBar: customNavBar,
    );
  }
}

Future<http.Response> postRequest () async {
  Uri url = Uri.parse('https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate');

  Map data = {
    'apikey': '12345678901234567890'
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  return response;
}