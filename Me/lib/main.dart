import 'package:Me/tabs/first_tab.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Me&U",
      theme: ThemeData(
          primaryColor: Colors.blue[400],
          accentColor: Colors.green[300],
          textTheme: TextTheme(
            bodyText2: GoogleFonts.nunito(),
          )),
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(
          seconds: 4,
          title:
              new Text('Sample Splash Screen', style: TextStyle(fontSize: 14)),
          image: new Image.asset('assets/images/flutter-logo.jpg'),
          backgroundColor: Colors.white,
          photoSize: 100.0,
          loaderColor: Colors.red,
          pageRoute: _createRoute()),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
