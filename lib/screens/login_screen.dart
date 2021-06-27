import 'package:flutter/material.dart';
import 'package:expenses_app/data/database.dart';
import 'package:expenses_app/screens/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Container(
          // color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(70.0),
            // padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/images/logo.png"),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xffcbefef),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    // decoration: InputDecoration(icon: Icon(Icons.account_box)),
                  ),
                ),
                SizedBox(height: 20,),
                Container(

                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xffcbefef),
                    borderRadius: BorderRadius.circular(18),
                  ),


                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),

                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {

                      Database.userID=_textEditingController.text;
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(),
                      ),
                      );
                    },
                    child: Text("LOGIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}