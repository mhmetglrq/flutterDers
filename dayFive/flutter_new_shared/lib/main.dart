import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int? counter;
  String? key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Obtain shared preferences.
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                // Save an integer value to 'counter' key.
                await prefs.setInt('counter', 10);
                // Save an boolean value to 'repeat' key.
                await prefs.setBool('repeat', true);
                // Save an double value to 'decimal' key.
                await prefs.setDouble('decimal', 1.5);
                // Save an String value to 'action' key.
                await prefs.setString('action', 'Start');
                // Save an list of strings to 'items' key.

                await prefs
                    .setStringList('items', <String>['Earth', 'Moon', 'Sun']);
              },
              child: const Text("Ekle"),
            ),
            Text("counter: $counter"),
            const Text("Hello")
                .animate()
                .fade(duration: 500.ms)
                .scale(delay: 500.ms),
            const Text("Hello World!")
                .animate()
                .fadeIn() // uses `Animate.defaultDuration`
                .scale() // inherits duration from fadeIn
                .move(
                    delay: 300.ms,
                    duration: 600.ms) // runs after the above w/new duration
            ,
            ElevatedButton(
              onPressed: () async {
                // Obtain shared preferences.
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                counter = prefs.getInt('counter');
                key = prefs.getKeys().toString();
                setState(() {});
              },
              child: const Text("Ekle"),
            ).animate().fadeIn(duration: 3000.ms).moveX(),
          ],
        ),
      ),
    );
  }
}
