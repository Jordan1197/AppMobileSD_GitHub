import 'package:borderlandapp/main.dart';
import 'package:flutter/material.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/planets.dart';
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
      title: 'Accueil',
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
      home: Accueil(),
    );
  }
}

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    var globalUser = ModalRoute.of(context)!.settings.arguments as User;

    final h1 = Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Borderlands 3 Helper',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    final p1 = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(
          "Welcome " +
              globalUser.name +
              " to the Borderlands 3 Helper! Use the sidebar to navigate and find what you're looking for.",
          textAlign: TextAlign.center,
        ));

    final h2 = Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Latest News',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const p2 = Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        "Head over to the website below for the latest news on how to get rich. \n https://chillchonkers.com",
        textAlign: TextAlign.center,
      ),
    );

    final h3 = Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Social media',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const p3 = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(
          "Be a part of our community:",
          textAlign: TextAlign.center,
        ));

    final h4 = Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
        child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                    text: 'About us',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
        ));

    const p4 = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(
          "Ww are passionate Borderlands games players. We wanted an easy way to access information on legendary and unique gear, so we developed a tool that does just that!",
          textAlign: TextAlign.center,
        ));

    final media = Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 50.0,
              height: 50.0,
              child: Image.asset(
                "assets/discordlogo.png",
                fit: BoxFit.contain,
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(' '),
          ),
          SizedBox(
              width: 50.0,
              height: 50.0,
              child: Image.asset(
                "assets/twitterlogo.png",
                fit: BoxFit.contain,
              )),
        ],
      ),
    );

//section navbar
    int _navSelectedIndex = 0;
    const TextStyle navOptionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> NavbarOptions = <Widget>[
      /*Text(
        'Index 0: Accueil',
        style: navOptionStyle,
      ),*/
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
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, //horizontal
              mainAxisAlignment: MainAxisAlignment.start, //vertical
              children: <Widget>[
                h1,
                p1,
                h2,
                p2,
                h3,
                p3,
                media,
                h4,
                p4,
              ],
            ),
          ),
        ),
      ),
      drawer: NavDrawer(),
      bottomNavigationBar: customNavBar,
    );
  }
}
