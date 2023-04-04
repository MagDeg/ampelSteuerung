import 'package:ampel_lampe_steuerung/controls/automatic.dart';
import 'package:flutter/material.dart';

import 'controls/manual.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);


  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int currentIndexOfShownPages = 0;

  final shownPages = [
    const ManualControl(),
    const AutomaticControl(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lampen Steuerung"),
      ),
      body: Center(child: shownPages[currentIndexOfShownPages],),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.indigo, Colors.indigoAccent],
            )
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          selectedIndex: currentIndexOfShownPages,
          onDestinationSelected: (int newIndex) {
            setState(() {
              currentIndexOfShownPages = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.accessibility,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.accessibility_outlined,
                  color: Colors.white,
                ),
                label: "Manuell"),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.keyboard,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.keyboard_outlined,
                  color: Colors.white,
                ),
                label: "Automatisch"),
          ],
        ),
      ),
    );
  }
}
