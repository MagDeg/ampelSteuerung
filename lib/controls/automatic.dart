import 'package:ampel_lampe_steuerung/functions/send_data_to_http.dart';
import 'package:flutter/material.dart';

import '../variables.dart';

//BlinkAsync


class AutomaticControl extends StatefulWidget {
  const AutomaticControl({Key? key}) : super(key: key);

  @override
  State<AutomaticControl> createState() => _AutomaticControlState();
}

class _AutomaticControlState extends State<AutomaticControl> {

  bool green = true;
  bool red = true;



  double greenTimeOn = 0;
  double greenTimeOff = 0;
  double redTimeOn = 0;
  double redTimeOff = 0;

  final greenTimeOnController = TextEditingController();
  final greenTimeOffController = TextEditingController();
  final redTimeOnController = TextEditingController();
  final redTimeOffController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    greenTimeOnController.text = greenTimeOn.toString();
    greenTimeOffController.text = greenTimeOff.toString();
    redTimeOnController.text = redTimeOn.toString();
    redTimeOffController.text = redTimeOff.toString();

    sendIpNow = "$webIpGlobal/BlinkAsync?";


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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Durch das Drücken auf eines der Felder wird die jeweilige Lampe der Ampel aus oder an geschaltet", style: TextStyle(fontSize: 17.0),),
                  const SizedBox(height: 25.0),
                  presetMode ? Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.black38, ), child: Container(padding: const EdgeInsets.all(8.0), child: const Text("Voreinstellungsmodus aktiv!", style: TextStyle(color: Colors.yellow, fontSize: 17.0)))) : Container(),
                  presetMode ? const SizedBox(height: 25.0) : Container(),
                  const Align(alignment: Alignment.centerLeft , child:  Text("Zeit grüne Lampe aus", style: TextStyle(fontSize: 17.0),)),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                            activeColor: Colors.green,
                            thumbColor: Colors.green,
                            inactiveColor: Colors.green,
                            max: 10,
                            divisions: 100,
                            value: greenTimeOff,
                            onChangeEnd: (value) {
                              data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";

                              if (!presetMode) {
                                fetchAlbum(data);
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                print(double.parse(value.toStringAsFixed(2)));
                                greenTimeOff = double.parse(value.toStringAsFixed(2));
                                greenTimeOffController.text = double.parse(value.toStringAsFixed(2)).toString();

                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: greenTimeOffController,
                              onSubmitted: (y) {
                                if (double.parse(y) > 10.0) {
                                  setState(() {
                                    greenTimeOff = 10.0;
                                    greenTimeOffController.text = "10";
                                  });
                                } else {
                                  setState(() {
                                    greenTimeOff = double.parse(y);
                                  });
                                  data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                    if (!presetMode) {
                                    fetchAlbum(data);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Align(alignment: Alignment.centerLeft , child:  Text("Zeit grüne Lampe an", style: TextStyle(fontSize: 17.0),)),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                            activeColor: Colors.green,
                            thumbColor: Colors.green,
                            inactiveColor: Colors.green,
                            max: 10,
                            divisions: 100,
                            value: greenTimeOn,
                            onChangeEnd: (value) {
                              data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                               if (!presetMode) {
                                 fetchAlbum(data);
                               }
                            },
                            onChanged: (value) {
                              setState(() {
                                greenTimeOn = double.parse(value.toStringAsFixed(2));
                                greenTimeOnController.text = double.parse(value.toStringAsFixed(2)).toString();
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: greenTimeOnController,

                              onSubmitted: (y) {
                                if (double.parse(y) > 10) {
                                  setState(() {
                                    greenTimeOn = 10.0;
                                    greenTimeOnController.text = "10";
                                  });
                                } else {
                                  setState(() {
                                    greenTimeOn = double.parse(y);
                                  });
                                }
                                data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  //red lamps
                  const SizedBox(height: 20.0),
                  const Align(alignment: Alignment.centerLeft , child:  Text("Zeit rote Lampe aus", style: TextStyle(fontSize: 17.0),)),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                            activeColor: Colors.red,
                            thumbColor: Colors.red,
                            inactiveColor: Colors.red,
                            max: 10,
                            divisions: 100,
                            value: redTimeOff,
                            onChangeEnd: (value) {
                              data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                              if (!presetMode) {
                                fetchAlbum(data);
                              }
                            },
                            onChanged:(value) {
                              setState(() {
                                redTimeOff = double.parse(value.toStringAsFixed(2));
                                redTimeOffController.text = double.parse(value.toStringAsFixed(2)).toString();
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: redTimeOffController,
                              onSubmitted: (y) {
                                if (double.parse(y) > 10) {
                                  setState(() {
                                    redTimeOff = 10.0;
                                    redTimeOffController.text = "10";
                                  });
                                } else {
                                  setState(() {
                                    redTimeOff = double.parse(y);
                                  });
                                }
                                data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Align(alignment: Alignment.centerLeft , child:  Text("Zeit rote Lampe an", style: TextStyle(fontSize: 17.0),)),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                            activeColor: Colors.red,
                            thumbColor: Colors.red,
                            inactiveColor: Colors.red,
                            max: 10,
                            divisions: 100,
                            value: redTimeOn,
                            onChangeEnd: (value) {
                              data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                              if (!presetMode) {
                                fetchAlbum(data);
                              }
                            },
                            onChanged:(value) {
                              setState(() {
                                redTimeOn = double.parse(value.toStringAsFixed(2));
                                redTimeOnController.text = double.parse(value.toStringAsFixed(2)).toString();
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: redTimeOnController,
                              onSubmitted: (y) {
                                if (double.parse(y) > 10) {
                                  setState(() {
                                    redTimeOn = 10.0;
                                    redTimeOnController.text = "10";
                                  });
                                } else {
                                  setState(() {
                                    redTimeOn = double.parse(y);
                                  });
                                }
                                data = "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                            ),
                          ),
                        ),
                      )
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
