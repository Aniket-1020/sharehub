import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sharehub/screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Transparent status bar
      systemNavigationBarColor: Colors.transparent, // Transparent navigation bar
      statusBarIconBrightness: Brightness.dark, // Icons' brightness in the status bar
      systemNavigationBarIconBrightness: Brightness.dark, // Icons' brightness in the nav bar
    ));

    return MaterialApp(
      initialRoute: '/homepageScreen',
      routes: {
        '/homepageScreen': (context) => const HomepageScreen(),

    },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
