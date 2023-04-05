import 'package:ampel_lampe_steuerung/controls/automatic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'controls/manual.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int currentIndexOfShownPages = 1;

  final shownPages = [
    const ManualControl(),
    const AutomaticControl(),
  ];

  bool automatic = true;
  bool manuel = false;
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lampen Steuerung"),
        ),
        body:

          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Center(
                          child: Container(
                            color: automatic ? Color(0x00BFFF).withOpacity(0.4) : Colors.transparent,
                            child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          if(automatic) {
                                            return;
                                          } else {
                                            automatic = true;
                                            manuel = false;
                                            x = false;
                                            currentIndexOfShownPages = 1;
                                          }
                                        });

                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.computer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Automatik',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                  ),
                          ))),
                  Expanded(
                      child: Center(
                          child: Container(
                            color: manuel ? Color(0x00BFFF).withOpacity(0.4) : Colors.transparent,
                            child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if(manuel) {
                                          return;
                                        } else {
                                          manuel = true;
                                          automatic = false;
                                          x = false;
                                          currentIndexOfShownPages = 0;
                                        }
                                      });


                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.accessibility,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Manuell',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                          ))),
                  Expanded(
                      child: Center(
                          child: Container(
                            color: x ? Color(0x00BFFF).withOpacity(0.4) : Colors.transparent,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  if(x) {
                                    return;
                                  } else {
                                    x = true;
                                    automatic = false;
                                    manuel = false;
                                  }
                                });

                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.nfc_sharp,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'x',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                ],
              ),
            ),
            body: Center(child: shownPages[currentIndexOfShownPages],),
        )
        // bottomNavigationBar: Container(
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //         colors: <Color>[Colors.indigo, Colors.indigoAccent],
        //       )
        //   ),
        //   child: NavigationBar(
        //     backgroundColor: Colors.transparent,
        //     selectedIndex: currentIndexOfShownPages,
        //     onDestinationSelected: (int newIndex) {
        //       setState(() {
        //         currentIndexOfShownPages = newIndex;
        //       });
        //     },
        //     destinations: const [
        //       NavigationDestination(
        //           selectedIcon: Icon(
        //             Icons.accessibility,
        //             color: Colors.white,
        //           ),
        //           icon: Icon(
        //             Icons.accessibility_outlined,
        //             color: Colors.white,
        //           ),
        //           label: "Manuell"),
        //       NavigationDestination(
        //           selectedIcon: Icon(
        //             Icons.keyboard,
        //             color: Colors.white,
        //           ),
        //           icon: Icon(
        //             Icons.keyboard_outlined,
        //             color: Colors.white,
        //           ),
        //           label: "Automatisch"),
        //     ],
        //   ),
        // ),
        );
  }
}
