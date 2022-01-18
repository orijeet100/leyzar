import 'package:flutter/material.dart';
import 'package:leyzar/screens/final_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
  bool showSpinner=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body:ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: TextFormField(
                  obscureText: false,
                  decoration: KTextField.copyWith(hintText: 'Enter your email address'),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    email=value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  obscureText: false,
                  decoration: KTextField.copyWith(hintText: 'Enter your password'),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value){
                    password=value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Material(
                  elevation: 5,
                  color: Color(0xFF2576FF),
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    child: Text('Register', style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18,
                    )),
                    onPressed: () async{
                      setState(() {
                        showSpinner=true;
                      });
                      try {
                        await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalScreen()));
                      } on Exception catch (e) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Error",
                          desc: "$e",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "CANCEL",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                      setState(() {
                        showSpinner=false;
                      });

                    },
                    minWidth: double.infinity,
                    height: 45,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}