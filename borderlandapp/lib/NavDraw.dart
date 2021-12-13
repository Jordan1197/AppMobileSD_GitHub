
import 'package:flutter/material.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/characterdetails.dart';


class NavDrawer extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget> [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/bl3logo.png')
              ),
            )
            
          )),
          //ITEMS   
          ExpansionTile(
            title: Text(
              "Items",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget> [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ItemList(), //pop la fenetre itemlist avec le filtre des weapons
                      ));
                    },
                    child: const Text("Weapons"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ItemList(), //pop la fenetre itemlist avec le filtre des grenades
                      ));
                    },
                     child: const Text("Grenades"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ItemList(), //pop la fenetre itemlist avec le filtre des shields
                      ));
                    },
                     child: const Text("Shield"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ItemList(), //pop la fenetre itemlist avec le filtre des artifacts
                      ));
                    },
                     child: const Text("Artifacts"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ItemList(), //pop la fenetre itemlist avec le filtre des class mods
                      ));
                    },
                     child: const Text("Class mods"),
                  ),                 
              ],
              
          ),
          //CHARACTERS
          ExpansionTile(
            title: Text(
              "Characters",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget> [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Accueil(),// characterdetails(), //pop la fenetre détails du characters
                      ));
                    },
                    child: const Text("Amara"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Accueil(),// characterdetails(), //pop la fenetre détails du characters
                      ));
                    },
                    child: const Text("Fl4k"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Accueil(),// characterdetails(), //pop la fenetre détails du characters
                      ));
                    },
                    child: const Text("Moze"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Accueil(),// characterdetails(), //pop la fenetre détails du characters
                      ));
                    },
                    child: const Text("Zane"),
                  ),                
              ],
              
          ),
          //ENNEMIES
           ExpansionTile(
            title: Text(
              "Ennemies",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget> [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Accueil(),// ennemiedetails(), //pop la fenetre détails de l'ennemie
                      ));
                    },
                    child: const Text("Skag"),
                  ),
                                  
              ],
              
          ),
          //OTHERS
           ExpansionTile(
            title: Text(
              "Other",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget> [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => PlanetList(),//pop les planets
                      ));
                    },
                    child: const Text("Planets"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => PlanetList(),//pop les elements
                      ));
                    },
                    child: const Text("Elements"),
                  ),             
              ],
              
          ),
          
        ],
      ),
      
        
      
    );
  }
}