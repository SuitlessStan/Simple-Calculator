import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Me&U",
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.green,
          textTheme: TextTheme(
            bodyText2: GoogleFonts.nunito(),
          )),
      home: Scaffold(
        drawer: NavigationDrawer(),
        body: Container(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Esam Olwan"),
            accountEmail: Text("lands.of.48@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.white
                  : Color(0xFFB3b5998),
              child: Text(
                //Temporary athestic
                "E",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("My Profile"),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.app_settings_alt),
          ),
        ],
      ),
    );
  }
}
