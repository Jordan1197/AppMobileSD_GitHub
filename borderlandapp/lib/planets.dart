import 'package:borderlandapp/main.dart';
import 'package:borderlandapp/model/models.dart';
import 'package:flutter/material.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/NavDraw.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

List<Planet> planets = [];
Future<List<Planet>> fetchPlanets(Future<User> user) async {
  User u = await user;
  final response = await http.get(
    Uri.parse('https://borderlands3apisd.azurewebsites.net/api/Planets'),
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
    planets = List<Planet>.from(
        json.decode(response.body).map((data) => Planet.fromJson(data)));
    return planets;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load planet');
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlanetList(),
    );
  }
}

class PlanetList extends StatefulWidget {
  const PlanetList({Key? key}) : super(key: key);

  @override
  State<PlanetList> createState() => _PlanetListState();
}

class _PlanetListState extends State<PlanetList> {
  late Future<List<Planet>> futurePlanets;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<User> u;
    var globalUser = ModalRoute.of(context)!.settings.arguments as User;
    u = UserLogged(globalUser.name, globalUser.password);
    futurePlanets = fetchPlanets(u);

    //Page title
    final pageTitle = Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Other',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
      ),
    );

    final planetLabel = Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Planets',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
      ),
    );

    final elementLabel = Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Elements',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
      ),
    );

    //section navbar
    int _navSelectedIndex = 4;
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
      body: FutureBuilder<List<Planet>>(
          future: futurePlanets,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Planet p = snapshot.data![index];
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: RichText(
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: p.name,
                                          style: const TextStyle(
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
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                                child: Image.network(
                                              p.image,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fill,
                                            )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Flexible(
                                                child: Text(p.description)),
                                          ],
                                        )
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 5,
                                    margin: const EdgeInsets.all(10),
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator(
              backgroundColor: Color.fromARGB(0, 255, 0, 0),
            );
          }),
      drawer: NavDrawer(),
      bottomNavigationBar: customNavBar,
    );
  }
}
