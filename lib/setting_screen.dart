import 'package:ampel_lampe_steuerung/control_page.dart';
import 'package:ampel_lampe_steuerung/functions/shared_preferences.dart';
import 'package:ampel_lampe_steuerung/variables.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final webIp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    webIp.text = webIpGlobal;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ControlPage()));
          },
          icon: const Icon(Icons.arrow_back),

        ),
        title: const Text("Einstellungen"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black26,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Voreinstellungsmodus", style: TextStyle(fontSize: 17.0)),
                      const SizedBox(width: 20.0),
                      Switch(
                          value: presetMode,
                          onChanged: (x) {
                            setState(() {
                              presetMode = x;
                              print(presetMode);
                            });
                          }),
                     ],
                  ),
                  presetMode ? Container(padding: const EdgeInsets.all(8.0), child: const Text("Der Voreinstellungsmodus ermöglicht dir bestimmte Voreinstellungen zu treffen, die nicht in Echtzeit übernommen werden. Um diese an dei Ampel zu schicken, musst du sie durch ein Drücken auf den unten rechts erscheindenden Button an die Ampel senden.")) : Container(),
                  const SizedBox(height: 50.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black38,
                      ),
                      child: TextField(
                        cursorColor: Colors.white,
                        controller: webIp,
                        decoration: const InputDecoration(
                          labelText: "Web IP",
                          labelStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        style: const TextStyle(color: Colors.white),
                        onSubmitted: (y) {
                          setState(() {
                            webIp.text = y;
                            webIpGlobal = y;
                            print(webIpGlobal);
                            setPrefNewId();
                          });

                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
