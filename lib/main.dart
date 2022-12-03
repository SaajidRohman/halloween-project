import 'package:flutter/material.dart';
import 'button.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool running = true;
  bool endVisible = false;
  static List<bool> isVisible = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List frames = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (running) {
      for (int i = 0; i < 16; i++) {
        if (frames[i] == 0) {
          isVisible[i] = !isVisible[i];
          frames[i] = Random().nextInt(50) + 1;
        }
        frames[i]--;
      }
    }
    void randomize(Duration d) {
      setState(() {});
    }

    if (running) Ticker(randomize).start();
    if (_counter == 10) {
      running = false;
      endVisible = true;
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Visibility(visible: endVisible, child: const Text('Happy Halloween!')),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(children: <Widget>[
            buildButton(isVisible[0], _incrementCounter),
            buildButton(isVisible[1], _incrementCounter),
            buildButton(isVisible[2], _incrementCounter),
            buildButton(isVisible[3], _incrementCounter),
          ]),
          Column(children: <Widget>[
            buildButton(isVisible[4], _incrementCounter),
            buildButton(isVisible[5], _incrementCounter),
            buildButton(isVisible[6], _incrementCounter),
            buildButton(isVisible[7], _incrementCounter),
          ]),
          Column(children: <Widget>[
            buildButton(isVisible[8], _incrementCounter),
            buildButton(isVisible[9], _incrementCounter),
            buildButton(isVisible[10], _incrementCounter),
            buildButton(isVisible[11], _incrementCounter),
          ]),
          Column(children: <Widget>[
            buildButton(isVisible[12], _incrementCounter),
            buildButton(isVisible[13], _incrementCounter),
            buildButton(isVisible[14], _incrementCounter),
            buildButton(isVisible[15], _incrementCounter),
          ]),
        ]),
        Text('$_counter'),
      ]),
    );
  }
}
