import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:expenses_app/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final style = TextStyle(fontSize: 62, fontWeight: FontWeight.bold);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.grey,

        appBarTheme: AppBarTheme(
          color: Color(0xffcbefef),

        ),
        fontFamily: 'Raleway',
        // primarySwatch: Colors.pink,
        backgroundColor: Color(0xffcbefef),
        accentColor: Color(0xffcbefef),
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Color(0xffcbefef),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}