import 'package:flutter/material.dart';
import './screens/home/home_screen.dart';
import './screens/details/details_screen.dart';
import './screens/login/login_screen.dart';


void main () {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter OKej",
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }
}