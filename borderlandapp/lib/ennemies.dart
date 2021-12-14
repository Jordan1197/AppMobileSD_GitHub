import 'package:flutter/material.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/main.dart';
import 'package:borderlandapp/ennemiedetails.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/NavDraw.dart';
import 'package:borderlandapp/model/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

List<Ennemy> ennemies = [];
Future<List<Ennemy>> fetchEnnemies(Future<User> user) async {
  User u = await user;
  final response = await http.get(
    Uri.parse('https://borderlands3apisd.azurewebsites.net/api/ennemies'),
    headers: {
      'Access-Control-Allow-Headers': '*',
      'Access-Control-Allow-Origin': "*",
      'Access-Control-Allow-Methods': "*",
      'Content-Type': 'application/json',
      'Token': u.token,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    ennemies = List<Ennemy>.from(
        json.decode(response.body).map((data) => Ennemy.fromJson(data)));
    ennemies.forEach((element) => print(element));
    return ennemies;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ennemies');
  }
}

Future<EnnemyDetailsCall>? ennemyDetails;
Future<EnnemyDetailsCall> fetchEnnemyDetails(
    Future<User> user, Ennemy e) async {
  User u = await user;
  final response = await http.get(
    Uri.parse(
        'https://borderlands3apisd.azurewebsites.net/api/Ennemies/name/' +
            e.name),
    headers: {
      'Access-Control-Allow-Headers': '*',
      'Access-Control-Allow-Origin': "*",
      'Access-Control-Allow-Methods': "*",
      'Content-Type': 'application/json',
      'Token': u.token, 
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    EnnemyDetailsCall ch = EnnemyDetailsCall.fromJson(jsonDecode(response.body)) ;
        EnnemyDetailsCall.fromJson(jsonDecode(response.body));

    return ch;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ennemy');
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ennemies List',
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
      home: EnnemiesList(title: "Ennemy List"),
    );
  }
}

class EnnemiesList extends StatefulWidget {
  const EnnemiesList({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<EnnemiesList> createState() => _EnnemiesListState();
}

class _EnnemiesListState extends State<EnnemiesList> {
  late Future<List<Ennemy>> futureEnnemies;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<User> u;
    var globalUser = ModalRoute.of(context)!.settings.arguments as User;
    u = UserLogged(globalUser.name, globalUser.password);
    futureEnnemies = fetchEnnemies(u);

    //Page title
    final pageTitle = Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Ennemie list',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
      ),
    );

    //section navbar
    int _navSelectedIndex = 3;
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: FutureBuilder<List<Ennemy>>(
          future: futureEnnemies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Ennemy e = snapshot.data![index];
                    return Center(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Ennemies",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ]),
                                ),
                              ),
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EnnemyDetails(),
                                            settings: RouteSettings(
                                              arguments: await fetchEnnemyDetails(u, e),
                                            )));
                                  },
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Flexible(
                                                child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: e.name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    )
                                                  ]),
                                            )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                             // child: Image.network(
                                            //    e.,
                                            //    height: 150,
                                            //    fit: BoxFit.fill,
                                           //   ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(e.ennemieType.description),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 5,
                                    margin: const EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator(
              backgroundColor: Color.fromARGB(0, 255, 0, 0),
            );
          }),
      drawer: NavDrawer(),
      bottomNavigationBar: customNavBar,
    );
  }
}
