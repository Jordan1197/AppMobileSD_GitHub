// ignore_for_file: file_names

import 'package:borderlandapp/main.dart';
import 'package:borderlandapp/model/models.dart';
import 'package:flutter/material.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
      title: 'Manage Planets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MangageItems(title: 'Manage Planets'),
    );
  }
}

class MangageItems extends StatefulWidget {
  const MangageItems({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MangageItems> createState() => _MangageItems();
}

class _MangageItems extends State<MangageItems> {
  late Future<List<EquipmentType>> futureEqTypes;
  late Future<List<Rarity>> futureRarities;
  late Future<List<Ennemy>> futureEnnemies;

  @override
  void initState() {
    super.initState();
    picker = new ImagePicker();
  }

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  var picker;

  String dropdownValue = 'Weapon';
  String rarityValue = 'Legendary';
  String ennemyValue = 'Genevieve';

  @override
  Widget build(BuildContext context) {
    Future<User> u;
    var globalUser = ModalRoute.of(context)!.settings.arguments as User;
    u = UserLogged(globalUser.name, globalUser.password);
    //Title
    final h1 = Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Manage Planets',
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
      // ignore: avoid_print
      print(responseString);
    }

    final imgbutton = Material(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: 300,
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
          child: const Text(
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
          postPlanet(nameController.text,descriptionController.text,globalUser);
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
              MaterialPageRoute(builder: (context) => const Settings(),
                settings: RouteSettings(
                  arguments: await u,
                ),
              ));
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
              settings: RouteSettings(
                  arguments: globalUser,
            )));
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          mainAxisAlignment: MainAxisAlignment.start, //vertical
          children: <Widget>[
            h1,
            nameField,
            description,
            const SizedBox(
              height: 20.0,
            ),
            imgbutton,
            const SizedBox(
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

Future<void> postPlanet (String name, String desc, User u) async{
  
    final response =  await http.post(
    Uri.parse('https://borderlands3apisd.azurewebsites.net/api/Planets/'),

    headers: {
      'Access-Control-Allow-Headers': '*',          
      'Access-Control-Allow-Origin': "*",
      'Access-Control-Allow-Methods': "*",
      'Content-Type': 'application/json',
      'Token': u.token,
    },
    body: jsonEncode(<String, String>{
          'id':"",
          'name':name,
          'description':desc,
          'image':'https://chillchonkers.mypinata.cloud/ipfs/QmU1kZNZDdQRSQcS1e5ByzriZN97tMSWtxvfBgPEQeQWSZ'
        }),
    );
}
