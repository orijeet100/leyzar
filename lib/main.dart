import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:leyzar/screens/login_screen.dart';
import 'package:leyzar/screens/registration_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: WelcomeScreen(),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Leyzar',
              style: TextStyle(
                color: Colors.white,
                // fontFamily: 'Righteous',
                fontSize: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Material(
              elevation: 5,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                child: Text('Login', style: TextStyle(
                  // fontFamily: 'Poppins',
                  color: Colors.purple[900],
                  fontSize: 18,
                )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                minWidth: double.infinity,
                height: 45,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Material(
              elevation: 5,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                child: Text('Register', style: TextStyle(
                  // fontFamily: 'Poppins',
                  color: Colors.purple[900],
                  fontSize: 18,
                )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                },
                minWidth: double.infinity,
                height: 45,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 80),
            child: Text('New users have to register first before login',style: TextStyle(
              color: Colors.grey[100],
              fontSize: 15
            ),),
          )
        ],
      ),
    );
  }
}

