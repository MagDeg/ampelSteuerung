import 'package:ampel_lampe_steuerung/controls/automatic.dart';
import 'package:ampel_lampe_steuerung/setting_screen.dart';
import 'package:ampel_lampe_steuerung/variables.dart';
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SettingScreen()));
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: Scaffold(
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
        ),
      floatingActionButton: presetMode ? FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.upload_rounded),
      ) : Container(),
        );
  }
}
