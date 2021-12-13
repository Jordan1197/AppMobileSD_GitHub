import 'package:flutter/material.dart';
import 'package:borderlandapp/ennemies.dart';
import 'package:borderlandapp/items.dart';
import 'package:borderlandapp/characters.dart';
import 'package:borderlandapp/settings.dart';
import 'package:borderlandapp/Planets.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/NavDraw.dart';
import 'package:borderlandapp/main.dart';
import 'package:borderlandapp/model/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:crypt/crypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Account',
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
      home: const CreateAccount(title: 'Create Account'),
    );
  }
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CreateAccount> createState() => _CreateAcc();
}
String Encrypt(String password){
  
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String hashedPassword = stringToBase64.encode(password);

  return hashedPassword;
}
class _CreateAcc extends State<CreateAccount> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey =GlobalKey<FormState>();
  User u = User(name: "",password: "",token: "null",role: "User");

  Future<http.Response> CreateUser(String username, String password){
    User u =  User(name:username,password:password,token:"defaul",role:"User");
     final usernameEncryptedPassword= Encrypt(password);
     
      return http.post(
        Uri.parse('https://borderlands3apisd.azurewebsites.net/api/user'),
        
        
        headers:{
          'Access-Control-Allow-Headers': '*',          
          'Access-Control-Allow-Origin': "*",
          'Access-Control-Allow-Methods': "*",
          'Content-Type': 'application/json',          
        },
        body: jsonEncode(<String, String>{
          'username':u.name,
          'password':u.password,
          'token':u.token,
          'role':u.role
        }),
      );
            
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
                text: 'Create your account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
      ),
    );


      final addButton = Material(
      borderRadius: BorderRadius.circular(15.0),
      color: const Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 300,
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login(title: "Login",)));
        },
        child: const Text(
          "Create",
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login(title: "Login",)));
        },
        child: const Text(
          "Cancel",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );


    final form = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            obscureText: false,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Username",
            hintText: "Username",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Password",
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        
          ),
          Container(
            padding: const EdgeInsets.only(top:40.0),
            child: ElevatedButton(
              onPressed: (){                
                CreateUser(usernameController.text, passwordController.text);
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Login(title: "Login",)));
              },
              child: Text('Create'),
              )
            ),
                  
        ],
        ),
    );
    

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          mainAxisAlignment: MainAxisAlignment.start, //vertical
          children: <Widget>[
            h1,           
            form,
            cancelButton,
          ],
        ),
      ),
    );
  }
}