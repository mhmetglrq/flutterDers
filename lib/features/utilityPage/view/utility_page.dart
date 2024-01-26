import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';

class UtilityPage extends StatefulWidget {
  const UtilityPage({super.key});

  @override
  State<UtilityPage> createState() => _UtilityPageState();
}

enum SingingCharacter { lafayette, jefferson }

class _UtilityPageState extends State<UtilityPage> {
  bool switchBoolean = true;
  bool textFieldBoolean = true;
  bool radioButtonBoolean = true;
  final TextEditingController _dateController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          children: [
            const Text("Switch"),
            Switch(
              activeColor: Colors.blue,
              activeTrackColor: Colors.amber,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.cyan,
              // thumbColor: const MaterialStatePropertyAll(Colors.amber),
              // trackOutlineColor: const MaterialStatePropertyAll(Colors.red),
              value: switchBoolean,
              onChanged: (value) {
                setState(() {
                  switchBoolean = !switchBoolean;
                });
              },
            ),
            const Text("TextField"),
            TextField(
              controller: _dateController,
              textCapitalization: TextCapitalization.words,
              autofocus: true,
              // readOnly: true,
              onTap: () {},
              spellCheckConfiguration: SpellCheckConfiguration(
                misspelledSelectionColor: Colors.red,
                spellCheckService: DefaultSpellCheckService(),
              ),
              cursorOpacityAnimates: false,
              decoration: const InputDecoration(
                helperText: "Bu senin için Ömer",
                helperStyle: TextStyle(color: Colors.blue),
                // errorText: "Bu senin için değildi Ömer",
                labelText: "OMER",
                hintText: "Omer yardımcı",
                suffix: Text(".com"),
                prefix: Text("www."),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.pink,
                  ),
                ),
                counterText: "OMER COUNTER",
                semanticCounterText: "OMER",
              ),
            ),
            const Text("Radio"),
            ListTile(
              title: const Text('Lafayette'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Thomas Jefferson'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            // Image.asset(
            //   "assets/images/pony.jpg",
            //   fit: BoxFit.cover,
            //   height: 300,
            //   width: 300,
            // ),
            Image.network(
                "https://www.dekoros.com/wp-content/uploads/2023/03/YC-00008-2-2.jpg"),
          ],
        ),
      ),
    );
  }
}
