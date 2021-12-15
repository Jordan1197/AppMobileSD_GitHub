import 'package:flutter/material.dart';
import 'package:borderlandapp/accueil.dart';
import 'package:borderlandapp/model/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:borderlandapp/createaccount.dart';


Future<User>? globalUser;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
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
      home: const Login(title: 'Login Page'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Login> createState() => _LoginState();
}



String Decrypt(String password){
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  
  String decryptedPassword = stringToBase64.decode(password);

  return decryptedPassword;
}
var errorlogin = Text("");
Future<bool> LoginUser (String username, String password) async{
  
  
  
    final response =  await http.post(
    Uri.parse('https://borderlands3apisd.azurewebsites.net/api/User/LogUser'),

    headers: {
      'Access-Control-Allow-Headers': '*',          
      'Access-Control-Allow-Origin': "*",
      'Access-Control-Allow-Methods': "*",
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
          'username':username,
          'password':password
        }),
    );
    if(response.statusCode == 200){
      globalUser = UserLogged(username, password);
      return true;
    }
    else{
      return false;
    }

}

Future<User> UserLogged(String username,String password) async{
  final response = await http.get(Uri.parse('https://borderlands3apisd.azurewebsites.net/api/user/'+username+"/"+password));
  if(response.statusCode == 200){
        User u = User.fromJson(jsonDecode(response.body));
        return u;
      }
      else{
        throw Exception('Failed to load users');
      }
}

class _LoginState extends State<Login> {
  //final Future<User> futureUser =fetchUser();
  final nameController = TextEditingController();
  final pwdController = TextEditingController();
  
  @override
  void initstate() {
    super.initState();
    
    nameController.addListener(() {
      final String text = nameController.text.toLowerCase();
      nameController.value = nameController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    pwdController.addListener(() {
      final String text = pwdController.text.toLowerCase();
      nameController.value = pwdController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final nameField = TextFormField(
        controller: nameController,
        obscureText: false,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Name",
        hintText: "Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final passwordField = TextFormField(
      controller: pwdController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          labelText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        onPressed: () async {
                if(await LoginUser(nameController.text,pwdController.text) == true){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Accueil(),
                                        settings: RouteSettings(arguments: await globalUser,)
                ));
                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login(title: "Login",)
                                        
                ));
                }
                },
                child: Text('Login',
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.white),),
                               
              )
      );

    final createButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateAccount(
                        title: "Create Account",
                      )));
        },
        child: Text(
          "Create Account",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    /*final users = 
    FutureBuilder<User>(
      future: futureUser,
      builder:(context, snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data!.name);
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        return Text("yo");
      }
    );*/

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    child: Image.asset(
                  "assets/bl3logo.png",
                  fit: BoxFit.contain,
                )),
                const SizedBox(height: 45.0),
                nameField,
                const SizedBox(height: 25.0),
                passwordField,
                const SizedBox(
                  height: 35.0,
                ),
                errorlogin,
                loginButon,
                const SizedBox(
                  height: 20.0,
                ),
                createButton,
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
