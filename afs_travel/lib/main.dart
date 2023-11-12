import 'package:afs_travel/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Travel UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3EBACE),
            primary: const Color(0xFF3EBACE),
            secondary: const Color(0xFFD8ECF1),
            background: const Color(0xFFF3F5F7),
          )),
      home: const HomeScreen(),
    );
  }
}
