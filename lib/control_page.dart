import 'package:ampel_lampe_steuerung/controls/automatic.dart';
import 'package:ampel_lampe_steuerung/controls/sync.dart';
import 'package:ampel_lampe_steuerung/functions/send_data_to_http.dart';
import 'package:ampel_lampe_steuerung/setting_screen.dart';
import 'package:ampel_lampe_steuerung/variables.dart';
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
    const SyncControl()
  ];

  bool automatic = false;
  bool manuel = true;
  bool sync = false;

  @override
  Widget build(BuildContext context)  {

    switch(currentIndexOfShownPages) {
      case 0: {
        //changing ip
        sendIpNow = "$webIpGlobal?mode=BlinkManual";
        data = "$webIpGlobal/BlinkManual?state=$green$red";
        fetchAlbum(sendIpNow).then((value) => fetchAlbum(data));


        break;
      }
      case 1: {
        //changing ip
        sendIpNow = "$webIpGlobal?mode=BlinkAsync";
        data = "$webIpGlobal/BlinkAsync?on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
        fetchAlbum(sendIpNow).then((value) => fetchAlbum(data) );


        break;
      }
      case 2: {
        //changing ip
        //sendIpNow = "$webIpGlobal?mode=BlinkSync";
        //fetchAlbum(sendIpNow);
        break;
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Lampen Steuerung"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const  SettingScreen()));
                },
                icon: const Icon(Icons.settings))
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
                            color: automatic ? const Color(0x0000bfff).withOpacity(0.4) : Colors.transparent,
                            child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          if(automatic) {
                                            return;
                                          } else {
                                            automatic = true;
                                            manuel = false;
                                            sync = false;
                                            currentIndexOfShownPages = 1;




                                          }
                                        });

                                      },
                                      child: Column(
                                        children: const [
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
                            color: manuel ? const Color(0x0000bfff).withOpacity(0.4) : Colors.transparent,
                            child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if(manuel) {
                                          return;
                                        } else {
                                          manuel = true;
                                          automatic = false;
                                          sync = false;
                                          currentIndexOfShownPages = 0;


                                        }
                                      });


                                    },
                                    child: Column(
                                      children: const [
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
                            color: sync ? const Color(0x0000bfff).withOpacity(0.4) : Colors.transparent,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  if(sync) {
                                    return;
                                  } else {
                                    sync = true;
                                    automatic = false;
                                    manuel = false;
                                  }
                                });

                              },
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.sync,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Synchronisiert',
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
          print('button pressed');
          print(data);
          //sendData('Hello World');
        },
        child: const Icon(Icons.upload_rounded),
      ) : Container(),
        );
  }
}
