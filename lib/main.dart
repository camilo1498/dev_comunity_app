import 'package:dev_comunity_app/app/providers/providers.dart';
import 'package:dev_comunity_app/meta/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Monteserat'
        ),
        darkTheme: ThemeData.dark(),
        home: LoginView(),
      ),
    );
  }
}