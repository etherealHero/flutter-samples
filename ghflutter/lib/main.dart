import 'package:flutter/material.dart';
import 'strings.dart' as strings;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  const GHFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: strings.appTitle, home: GHFlutter());
  }
}

class GHFlutter extends StatefulWidget {
  const GHFlutter({super.key});

  @override
  State<GHFlutter> createState() => _GHFlutterState();
}

class _GHFlutterState extends State<GHFlutter> {
  final _todos = <Todo>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Future<void> _loadData() async {
    const dataUrl = 'https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(Uri.parse(dataUrl));

    setState(() {
      final dataList = json.decode(response.body) as List;
      for (final item in dataList) {
        final title = item['title'] as String? ?? '';
        final completed = item['completed'] as bool? ?? false;
        final todo = Todo(title, completed);

        _todos.add(todo);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: Text(
        _todos[i].title,
        style: _biggerFont,
      ),
      leading: Checkbox(
        value: _todos[i].completed,
        onChanged: (bool? newValue) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.appTitle),
        backgroundColor: Colors.green.shade600,
      ),
      body: ListView.separated(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int position) =>
            _buildRow(position),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

class Todo {
  Todo(this.title, this.completed);
  final String title;
  final bool completed;
}
