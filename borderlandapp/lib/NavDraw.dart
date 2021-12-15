// ignore_for_file: file_names, unused_import, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:borderlandapp/main.dart';
import 'package:flutter/material.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/characterdetails.dart';
import 'package:borderlandapp/model/models.dart';
import 'package:borderlandapp/navdraw.dart';
import 'package:borderlandapp/itemsfilter.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({required this.glob});
  final User glob;

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
                        builder: (context) => ItemListFilter(),
                        settings: RouteSettings(
                          arguments: glob,
                        ) //pop la fenetre itemlist avec le filtre des weapons
                      ));
                    },
                    child:  Text("Weapons"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){                      
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ItemListFilter(),
                        settings: RouteSettings(
                          arguments: glob,
                        ) //pop la fenetre itemlist avec le filtre des grenades
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
                        builder: (context) => ItemListFilter(),
                        settings: RouteSettings(
                          arguments: glob,
                        ) //pop la fenetre itemlist avec le filtre des shields
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
                        builder: (context) => ItemListFilter(),
                        settings: RouteSettings(
                          arguments: glob,
                        ) //pop la fenetre itemlist avec le filtre des artifacts
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
                        builder: (context) => ItemListFilter(),
                        settings: RouteSettings(
                          arguments: glob,
                        ) //pop la fenetre itemlist avec le filtre des class mods
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
                        builder: (context) => CharacterList(),
                        settings: RouteSettings(
                          arguments: glob,
                        )// characterdetails(), //pop la fenetre détails du characters
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
                        builder: (context) => CharacterList(),
                        settings: RouteSettings(
                          arguments: glob,
                        )// characterdetails(), //pop la fenetre détails du characters
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
                        builder: (context) => CharacterList(),
                        settings: RouteSettings(
                          arguments: glob,
                        )/// characterdetails(), //pop la fenetre détails du characters
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
                        builder: (context) => CharacterList(),
                        settings: RouteSettings(
                          arguments: glob,
                        )/// characterdetails(), //pop la fenetre détails du characters
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
                        builder: (context) => EnnemiesList(title: "Ennemie List",),
                        settings: RouteSettings(
                          arguments: glob,
                        )// ennemiedetails(), //pop la fenetre détails de l'ennemie
                      ));
                    },
                    child: const Text("Ennemie"),
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
                        builder: (context) => PlanetList(),
                        settings: RouteSettings(
                          arguments: glob,
                        )//pop les planets
                      ));
                    },
                    child: const Text("Planets"),
                  ),                               
              ],
              
          ),
          
        ],
      ),
      
        
      
    );
  }
}