import 'package:ampel_lampe_steuerung/functions/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'control_page.dart';

void main() {
  runApp(const MaterialApp(home: MainScreen()));
}



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    getPrefId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lampen Steuerung"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.center, child: Container(padding: const EdgeInsets.all(20.0), child: const Text("Um die Lampen der Ampel steuern zu können, müssen sie sich erst mit dem entsprechendem Wlan Netzwerk verbinden!", style: TextStyle(fontSize: 20.0),))),
            const SizedBox(height: 25.0),
            //TODO: implememt state: if connected or not

            OutlinedButton(

                style: const ButtonStyle(
                ),
                child: const Text("Starte Fernsteuerung"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ControlPage()));

                }

            ),

          ]
        ),
      ),
    );
  }
}
