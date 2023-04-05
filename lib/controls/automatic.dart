import 'package:flutter/material.dart';

class AutomaticControl extends StatefulWidget {
  const AutomaticControl({Key? key}) : super(key: key);

  @override
  State<AutomaticControl> createState() => _AutomaticControlState();
}

class _AutomaticControlState extends State<AutomaticControl> {

  bool green = false;
  bool red = false;

  bool active = false;
  bool preset = false;

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
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child:  Text('Automatischer Modus', style: TextStyle(fontSize: 17),)),
                      Expanded(
                        child: Switch(
                            value: active,
                            onChanged: (value) => setState(() {
                              active = value;
                              if(active) {
                                green = true;
                                red = true;
                              } else {
                                green = false;
                                red = false;
                              }
                            })),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child:  Text('Voreinstellung', style: TextStyle(fontSize: 17),)),
                      Expanded(
                        child: Switch(
                            value: preset,
                            onChanged: (value) => setState(() {
                              preset = value;
                            })),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Align(alignment: Alignment.centerLeft , child:  Text("Zeit grüne Lampe aus", style: TextStyle(fontSize: 17.0),)),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                            activeColor: Colors.green,
                            thumbColor: Colors.green,
                            inactiveColor: Colors.green,
                            max: 20,
                            value: greenTimeOn,
                            onChanged: active ? (value) {
                              setState(() {

                                greenTimeOn = value;
                                greenTimeOnController.text = value.round().toString();
                              });
                            } : null
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: greenTimeOnController,
                              onChanged: (x) {
                                setState(() {
                                  if (double.parse(x) > 20) {
                                    return;
                                  } else {
                                    greenTimeOn = double.parse(x);
                                  }

                                });
                              },
                              onSubmitted: (y) {
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    greenTimeOn = 20.0;
                                    greenTimeOnController.text = "20";
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
                            value: greenTimeOff,
                            onChanged: active ? (value) {
                              setState(() {
                                greenTimeOff = value;
                                greenTimeOffController.text = value.round().toString();
                              });
                            } : null
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: greenTimeOffController,
                              onChanged: (x) {
                                setState(() {
                                  if (double.parse(x) > 20) {
                                    return;
                                  } else {
                                    greenTimeOff = double.parse(x);
                                  }

                                });
                              },
                              onSubmitted: (y) {
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    greenTimeOff = 20.0;
                                    greenTimeOffController.text = "20";
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
                            value: redTimeOn,
                            onChanged: active ? (value) {
                              setState(() {
                                redTimeOn = value;
                                redTimeOnController.text = value.round().toString();
                              });
                            } : null
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: redTimeOnController,
                              onChanged: (x) {
                                setState(() {
                                  if (double.parse(x) > 20) {
                                    return;
                                  } else {
                                    redTimeOn = double.parse(x);
                                  }

                                });
                              },
                              onSubmitted: (y) {
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    redTimeOn = 20.0;
                                    redTimeOnController.text = "20";
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
                            value: redTimeOff,
                            onChanged: active ? (value) {
                              setState(() {
                                redTimeOff = value;
                                redTimeOffController.text = value.round().toString();
                              });
                            } : null
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 28,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: redTimeOffController,
                              onChanged: (x) {
                                setState(() {
                                  if (double.parse(x) > 20) {
                                    return;
                                  } else {
                                    redTimeOff = double.parse(x);
                                  }

                                });
                              },
                              onSubmitted: (y) {
                                if (double.parse(y) > 20) {
                                  setState(() {
                                    redTimeOff = 20.0;
                                    redTimeOffController.text = "20";
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
                              if (active) red = !red;
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
                              if (active) green = !green;
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
