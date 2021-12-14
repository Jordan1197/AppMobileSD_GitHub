import 'package:flutter/material.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/addItem.dart';
import 'package:borderlandapp/NavDraw.dart';
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
      home: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var globalUser = ModalRoute.of(context)!.settings.arguments as User;

    final h1 = Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Settings',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ]),
        ));

    final p1 = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Theme :',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
        ));

    final theme = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Light/Dark :',
                    ),
                  ]),
            ),
            Switch(
              value: false,
              onChanged: (value) {
                setState(() {});
              },
              activeTrackColor: Colors.blueAccent,
              activeColor: Colors.blue,
            )
          ],
        ));

    final h2 = Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Manage Items',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    final warning = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'You must be logged in as an administrator',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300)),
              ]),
        ));

    final addButton = Material(
      borderRadius: BorderRadius.circular(15.0),
      color: const Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 300,
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MangageItems(title: 'Manage Items'),
                  settings: RouteSettings(
                    arguments: globalUser,
                  )));
        },
        child: const Text(
          "Add Item",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final signout = Material(
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
          "Sign Out",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),
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
      Text(
        'Index 6: Expands',
        style: navOptionStyle,
      ),
    ];
    //fonction navbar
    final _pageOptions = [
      Accueil(),
      ItemList(),
      CharacterList(),
      EnnemiesList(title: "Ennemie Liste"),
      PlanetList(),
      Settings(),
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          mainAxisAlignment: MainAxisAlignment.start, //vertical
          children: <Widget>[
            h1,
            p1,
            theme,
            h2,
            warning,
            addButton,
            signout,
          ],
        ),
      ),
      drawer: NavDrawer(),
      bottomNavigationBar: customNavBar,
    );
  }
}
