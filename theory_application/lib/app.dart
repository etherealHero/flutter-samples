import 'package:flutter/material.dart';

import 'src/pages/main_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFda07eb),
          brightness: Brightness.dark,
          background: const Color(0xFF3450a1),
        ),
      ),
      home: const MainPage(),
    );
  }
}
