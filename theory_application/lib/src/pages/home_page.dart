import 'package:flutter/material.dart';

import '../state/counter_bloc.dart';
import '../state/counter_cubit.dart';
import '../widgets/counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cubit = CounterCubit();
  final bloc = CounterBloc();

  @override
  void initState() {
    super.initState();
    cubit.stream.listen((_) {});
    bloc.stream.listen((_) {});
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter title",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State manager'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopCounter(cubit.state),
              const Divider(),
              TopCounter(bloc.state),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  cubit.increment();
                });
              },
              child: const Text('C'),
            ),
            const SizedBox(height: 10.0),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  bloc.add(CounterEventPressed());
                });
              },
              child: const Text('B'),
            ),
          ],
        ),
      ),
    );
  }
}
