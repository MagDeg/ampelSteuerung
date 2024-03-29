import 'package:flutter/material.dart';

import '../functions/send_data_to_http.dart';
import '../variables.dart';

class SyncControl extends StatefulWidget {
  const SyncControl({Key? key}) : super(key: key);

  @override
  State<SyncControl> createState() => _SyncControlState();
}

class _SyncControlState extends State<SyncControl> {


  @override
  Widget build(BuildContext context) {

    sendIpNow = "$webIpGlobal/BlinkSync?";

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Einzelschaltung", style: TextStyle(fontSize: 17.0),),
                      const SizedBox(height: 25.0),
                      presetMode ? Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.black38, ), child: Container(padding: const EdgeInsets.all(8.0), child: const Text("Voreinstellungsmodus aktiv!", style: TextStyle(color: Colors.yellow, fontSize: 17.0)))) : Container(),
                      presetMode ? const SizedBox(height: 25.0) : Container(),
                      Row(
                        children: [
                          Expanded(
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  red = !red;
                                  if (red) {
                                    redInt = 1;
                                  } else {
                                    redInt = 0;
                                  }

                                  data = "${sendIpNow}state=$greenInt$redInt";
                                  if (!presetMode) {
                                    fetchAlbum(data);
                                  }
                                });
                              },
                              child: Container(
                                color: red ? Colors.red : Colors.black38,
                                height: 80.0,
                                child: const Center(
                                  child: Text('Rot', style: TextStyle(fontSize: 30),),
                                ),
                              ),

                            ),
                          ),
                          Container(
                            width: 2.0,
                            height: 80.0,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  green = !green;
                                  if (green) {
                                    greenInt = 1;
                                  } else {
                                    greenInt = 0;
                                  }

                                  data = "${sendIpNow}state=$greenInt$redInt";
                                  if (!presetMode) {
                                    fetchAlbum(data);
                                  }
                                });
                              },
                              child: Container(
                                color: green ? Colors.green : Colors.black38,
                                height: 80.0,
                                child: const Center(
                                  child: Text('Grün', style: TextStyle(fontSize: 30),),
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Wechselschaltung", style: TextStyle(fontSize: 17.0),),
                      const SizedBox(height: 25.0),
                      presetMode ? Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.black38, ), child: Container(padding: const EdgeInsets.all(8.0), child: const Text("Voreinstellungsmodus aktiv!", style: TextStyle(color: Colors.yellow, fontSize: 17.0)))) : Container(),
                      presetMode ? const SizedBox(height: 25.0) : Container(),
                      Row(
                        children: [
                          Expanded(
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  red = true;
                                  green = false;

                                  redInt = 1;
                                  greenInt = 0;

                                  data = "${sendIpNow}state=01";
                                  if (!presetMode) {
                                    fetchAlbum(data);
                                  }
                                });
                              },
                              child: Container(
                                color: red ? Colors.red : Colors.black38,
                                height: 80.0,
                                child: const Center(
                                  child: Text('Rot', style: TextStyle(fontSize: 30),),
                                ),
                              ),

                            ),
                          ),
                          Container(
                            width: 2.0,
                            height: 80.0,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  green = true;
                                  red = false;

                                  greenInt = 1;
                                  redInt = 0;

                                  data = "${sendIpNow}state=10";
                                  if (!presetMode) {
                                    fetchAlbum(data);
                                  }
                                });
                              },
                              child: Container(
                                color: green ? Colors.green : Colors.black38,
                                height: 80.0,
                                child: const Center(
                                  child: Text('Grün', style: TextStyle(fontSize: 30),),
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
