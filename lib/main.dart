import 'package:flutter/material.dart';

import 'control_page.dart';

void main() {
  runApp(MaterialApp(home: MainScreen()));
}



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lampen Steuerung"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.center, child: Container(padding: EdgeInsets.all(20.0), child: Text("Um die Lampen der Ampel steuern zu können, müssen sie sich erst mit dem entsprechendem Wlan Netzwerk verbinden!", style: TextStyle(fontSize: 20.0),))),
            SizedBox(height: 25.0),
            //TODO: implememt state: if connected or not

            OutlinedButton(

                style: ButtonStyle(
                ),
                child: Text("Starte Fernsteuerung"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ControlPage()));

                }

            )

          ]
        )
      ),
    );
  }
}
