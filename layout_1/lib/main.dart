import 'package:flutter/material.dart';
import 'package:layout_1/components/buttons.dart';
import 'package:layout_1/components/image_title.dart';
import 'package:layout_1/components/text.dart';
import 'package:layout_1/components/title.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
          ),
          body: ListView(
            children: const <Widget>[
              ImageTitle(),
              TitleSection(),
              Buttons(),
              MyText()
            ],
          )),
    );
  }
}
