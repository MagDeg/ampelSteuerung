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
    greenTimeOnController.text = greenTimeOn.round().toString();
    greenTimeOffController.text = greenTimeOff.round().toString();
    redTimeOnController.text = redTimeOn.round().toString();
    redTimeOffController.text = redTimeOff.round().toString();

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
                            max: 20,
                            value: greenTimeOff,
                            onChanged: (value) {
                              setState(() {
                                greenTimeOff = value;
                                greenTimeOffController.text = value.round().toString();

                                String data = "${sendIpNow}on=${greenTimeOn.round()},${redTimeOn.round()}&off=${greenTimeOff.round()},${redTimeOff.round()}";
                                print(data);
                                fetchAlbum(data);

                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 30,
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
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    greenTimeOff = 20.0;
                                    greenTimeOffController.text = "20";
                                  });
                                } else {
                                  setState(() {
                                    greenTimeOff = double.parse(y);
                                  });
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
                            max: 20,
                            value: greenTimeOn,
                            onChanged: (value) {
                              setState(() {
                                greenTimeOn = value;
                                greenTimeOnController.text = value.round().toString();
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 30,
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
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    greenTimeOn = 20.0;
                                    greenTimeOnController.text = "20";
                                  });
                                } else {
                                  setState(() {
                                    greenTimeOn = double.parse(y);
                                  });
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
                            max: 20,
                            value: redTimeOff,
                            onChanged:(value) {
                              setState(() {
                                redTimeOff = value;
                                redTimeOffController.text = value.round().toString();
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 30,
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
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    redTimeOff = 20.0;
                                    redTimeOffController.text = "20";
                                  });
                                } else {
                                  setState(() {
                                    redTimeOff = double.parse(y);
                                  });
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
                            max: 20,
                            value: redTimeOn,
                            onChanged:(value) {
                              setState(() {
                                redTimeOn = value;
                                redTimeOnController.text = value.round().toString();
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        width: 30,
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
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    redTimeOn = 20.0;
                                    redTimeOnController.text = "20";
                                  });
                                } else {
                                  setState(() {
                                    redTimeOn = double.parse(y);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RawMaterialButton(

                          onPressed: () {
                            setState(() {
                              red = !red;
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
            ),
          ),
        ),
      ],
    );
  }
}
