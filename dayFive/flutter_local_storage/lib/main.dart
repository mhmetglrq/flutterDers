import 'package:flutter/material.dart';
import 'package:flutter_local_storage/models/user.dart';
import 'package:flutter_local_storage/second_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('testBox');
  await Hive.openBox("settings");
  Box box = Hive.box("settings");
  await Hive.openBox("mode");
  box.put('darkMode', true);
  box.put('mode', "test");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("mode").listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return ValueListenableBuilder(
          valueListenable: Hive.box('settings').listenable(),
          builder: (BuildContext context, box, Widget? child) {
            return box.get("mode") == "test"
                ? MaterialApp(
                    title: 'Flutter Release',
                    theme: box.get("darkMode")
                        ? ThemeData.dark(
                            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                            useMaterial3: true,
                          )
                        : ThemeData.light(
                            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                            useMaterial3: true,
                          ),
                    home: const MyHomePage(title: 'Flutter Demo Home Page'),
                  )
                : MaterialApp(
                    title: 'Flutter Release',
                    theme: box.get("darkMode")
                        ? ThemeData.dark(
                            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                            useMaterial3: true,
                          )
                        : ThemeData.light(
                            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                            useMaterial3: true,
                          ),
                    home: const MyHomePage(title: 'Flutter Demo Home Page'),
                  );
          },
        );
      },
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
  Box testBox = Hive.box('testBox');

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
          children: [
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.amber,
              onPressed: () async {
                Box box = Hive.box('testBox');
                List nameList = [
                  "Mahmut",
                  "Mehmet",
                  "Mehdi",
                  "Baransel",
                  "Omer",
                ];
                box.put('name', nameList);
                box.get("name");
              },
              child: const Text("Adları Kaydet"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.amber,
              onPressed: () async {
                // List<Map<String, dynamic>> userList = [
                //   User(id: 1, name: "Mahmut", surname: "Yazlak").toMap(),
                //   User(id: 2, name: "Mehdi", surname: "qweqw").toMap(),
                //   User(id: 3, name: "Baransel", surname: "qwewqe").toMap(),
                //   User(id: 4, name: "Mehmet", surname: "qweqwe").toMap(),
                //   User(id: 5, name: "Omer", surname: "qwewqe").toMap(),
                // ];
                // testBox.put('age', userList);
              },
              child: const Text("Kişileri Kaydet"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.red,
              onPressed: () async {
                await Hive.openBox("sise");
              },
              child: const Text("Şişenin kapağını aç"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  color: Colors.blue,
                  onPressed: () async {
                    Box sise = Hive.box("sise");
                    sise.put("su", 300);
                  },
                  child: const Text("Su doldur"),
                ),
                MaterialButton(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  color: Colors.orange,
                  onPressed: () async {
                    Box sise = Hive.box("sise");
                    sise.add(700);
                  },
                  child: const Text("Su add"),
                ),
                MaterialButton(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  color: Colors.brown,
                  onPressed: () async {
                    Box sise = Hive.box("sise");
                    sise.put("kahve", 400);
                  },
                  child: const Text("kahve doldur"),
                ),
              ],
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.green,
              onPressed: () async {
                Box sise = Hive.box("sise");
                print(sise.get("su").toString());
              },
              child: const Text("Suyun miktarını getir"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.cyan,
              onPressed: () async {
                Box sise = Hive.box("sise");
                print(sise.get("kahve").toString());
              },
              child: const Text("Kahvenin miktarını getir"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.white30,
              onPressed: () async {
                Box sise = Hive.box("sise");
                print(sise.getAt(0).toString());
              },
              child: const Text("Add miktar getir"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.limeAccent,
              onPressed: () async {
                Box sise = Hive.box("sise");
                Hive.close();
              },
              child: const Text("Şişeyi Sil"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.deepPurple,
              onPressed: () async {
                Box sise = Hive.box("sise");
                sise.clear();
              },
              child: const Text("Sişeyi Boşalt"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.deepPurple,
              onPressed: () async {
                Box sise = Hive.box("sise");
                sise.delete("su");
              },
              child: const Text("Suyu İç"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.amber,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              ),
              child: const Text("Ikinci Sayfaya git"),
            ),
            MaterialButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.amber,
              onPressed: () {
                for (var element in testBox.values) {
                  debugPrint(element.toString());
                }
                for (var element in testBox.keys) {
                  debugPrint(element.toString());
                }
                debugPrint(testBox.length.toString());
                debugPrint(testBox.path);
              },
              child: const Text("Box Özellikleri"),
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box('settings').listenable(),
              builder: (context, box, widget) {
                return Switch(
                    value: box.get('darkMode') as bool,
                    onChanged: (val) {
                      box.put('darkMode', val);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
