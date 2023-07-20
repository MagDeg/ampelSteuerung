import 'package:ampel_lampe_steuerung/functions/send_data_to_http.dart';
import 'package:ampel_lampe_steuerung/functions/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../variables.dart';

//BlinkAsync

class AutomaticControl extends StatefulWidget {
  const AutomaticControl({Key? key}) : super(key: key);

  @override
  State<AutomaticControl> createState() => _AutomaticControlState();
}

class _AutomaticControlState extends State<AutomaticControl> {
  final greenTimeOnController = TextEditingController();
  final greenTimeOffController = TextEditingController();
  final redTimeOnController = TextEditingController();
  final redTimeOffController = TextEditingController();

  bool preset1 = false;
  bool preset2 = false;
  bool preset3 = false;
  bool preset4 = false;
  bool preset5 = false;
  bool preset6 = false;


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
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Einzelsteuerung",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(height: 25.0),
                  presetMode
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.black38,
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text("Voreinstellungsmodus aktiv!",
                                  style: TextStyle(
                                      color: Colors.yellow, fontSize: 17.0))))
                      : Container(),
                  presetMode ? const SizedBox(height: 25.0) : Container(),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Zeit grüne Lampe an",
                        style: TextStyle(fontSize: 17.0),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 15.0,
                            overlayColor: Colors.black,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20),
                          ),
                          child: Slider(
                              activeColor: Colors.green,
                              thumbColor: Colors.lightGreen,
                              inactiveColor: Colors.green,
                              max: 10,
                              divisions: 100,
                              value: greenTimeOn,
                              onChangeEnd: (value) {
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  greenTimeOn =
                                      double.parse(value.toStringAsFixed(2));
                                  greenTimeOnController.text =
                                      double.parse(value.toStringAsFixed(2))
                                          .toString();
                                });
                              }),
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
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

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
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Zeit grüne Lampe aus",
                        style: TextStyle(fontSize: 17.0),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 15.0,
                            overlayColor: Colors.black,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20),
                          ),
                          child: Slider(
                              activeColor: Colors.green,
                              thumbColor: Colors.lightGreen,
                              inactiveColor: Colors.green,
                              max: 10,
                              divisions: 100,
                              value: greenTimeOff,
                              onChangeEnd: (value) {
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  print(double.parse(value.toStringAsFixed(2)));
                                  greenTimeOff =
                                      double.parse(value.toStringAsFixed(2));
                                  greenTimeOffController.text =
                                      double.parse(value.toStringAsFixed(2))
                                          .toString();
                                });
                              }),
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
                                  data =
                                      "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                  //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

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

                  //red lamps
                  const SizedBox(height: 20.0),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Zeit rote Lampe an",
                        style: TextStyle(fontSize: 17.0),
                      )),
                  Row(
                    children: [
                      SliderTheme(
                        data: const SliderThemeData(
                          trackHeight: 15.0,
                          overlayColor: Colors.black,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 20),
                        ),
                        child: Expanded(
                          child: Slider(
                              activeColor: Colors.red,
                              thumbColor: Colors.redAccent,
                              inactiveColor: Colors.red,
                              max: 10,
                              divisions: 100,
                              value: redTimeOn,
                              onChangeEnd: (value) {
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  redTimeOn =
                                      double.parse(value.toStringAsFixed(2));
                                  redTimeOnController.text =
                                      double.parse(value.toStringAsFixed(2))
                                          .toString();
                                });
                              }),
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
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

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
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Zeit rote Lampe aus",
                        style: TextStyle(fontSize: 17.0),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 15.0,
                            overlayColor: Colors.black,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20),
                          ),
                          child: Slider(
                              activeColor: Colors.red,
                              thumbColor: Colors.redAccent,
                              inactiveColor: Colors.red,
                              max: 10,
                              divisions: 100,
                              value: redTimeOff,
                              onChangeEnd: (value) {
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

                                if (!presetMode) {
                                  fetchAlbum(data);
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  redTimeOff =
                                      double.parse(value.toStringAsFixed(2));
                                  redTimeOffController.text =
                                      double.parse(value.toStringAsFixed(2))
                                          .toString();
                                });
                              }),
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
                                data =
                                    "${sendIpNow}on=$greenTimeOn;$redTimeOn&off=$greenTimeOff;$redTimeOff";
                                //data = "${sendIpNow}on=$redTimeOn;$greenTimeOn&off=$redTimeOff;$greenTimeOff";

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 50.0,
                        child: Row(
                          children: [
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: preset1 ? Colors.blue : Colors.black26),
                                      height: 60.0,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              preset1 = !preset1;


                                              if (preset1) {
                                                preset2 = false;
                                                preset3 = false;
                                                preset4 = false;
                                                preset5 = false;
                                                preset6 = false;


                                                getPrefPreset("pres1_Green_On").then((value) {
                                                  if (value != null) {
                                                    greenTimeOn = value;
                                                  } else {
                                                    greenTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres1_Green_Off").then((value) {
                                                  if (value != null) {
                                                    greenTimeOff = value;
                                                  } else {
                                                    greenTimeOff = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres1_Red_On").then((value) {
                                                  if (value != null) {
                                                    redTimeOn = value;
                                                  } else {
                                                    redTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres1_Red_Off").then((value) {
                                                  if (value != null) {
                                                    redTimeOff = value;
                                                  } else {
                                                    redTimeOff = 1.0;
                                                  }
                                                });

                                              }
                                            });
                                          },
                                          onLongPress: () {},
                                          child: const Center(
                                              child: Text(
                                                "1",
                                                style: TextStyle(color: Colors.black),
                                              ))),
                                    ))),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: preset2 ? Colors.blue : Colors.black26),
                                      height: 60.0,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {

                                                preset2 = !preset2;

                                              if (preset2) {

                                                preset1 = false;
                                                preset3 = false;
                                                preset4 = false;
                                                preset5 = false;
                                                preset6 = false;

                                                getPrefPreset("pres2_Green_On").then((value) {
                                                  if (value != null) {
                                                    greenTimeOn = value;
                                                  } else {
                                                    greenTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres2_Green_Off").then((value) {
                                                  if (value != null) {
                                                    greenTimeOff = value;
                                                  } else {
                                                    greenTimeOff = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres2_Red_On").then((value) {
                                                  if (value != null) {
                                                    redTimeOn = value;
                                                  } else {
                                                    redTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres2_Red_Off").then((value) {
                                                  if (value != null) {
                                                    redTimeOff = value;
                                                  } else {
                                                    redTimeOff = 1.0;
                                                  }
                                                });

                                              }
                                            });
                                          },
                                          onLongPress: () {},
                                          child: const Center(
                                              child: Text(
                                                "2",
                                                style: TextStyle(color: Colors.black),
                                              ))),
                                    ))),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: preset3 ? Colors.blue : Colors.black26),
                                      height: 60.0,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {

                                                preset3 = !preset3;

                                              if (preset3) {

                                                preset1 = false;
                                                preset2 = false;
                                                preset4 = false;
                                                preset5 = false;
                                                preset6 = false;

                                                getPrefPreset("pres3_Green_On").then((value) {
                                                  if (value != null) {
                                                    greenTimeOn = value;
                                                  } else {
                                                    greenTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres3_Green_Off").then((value) {
                                                  if (value != null) {
                                                    greenTimeOff = value;
                                                  } else {
                                                    greenTimeOff = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres3_Red_On").then((value) {
                                                  if (value != null) {
                                                    redTimeOn = value;
                                                  } else {
                                                    redTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres3_Red_Off").then((value) {
                                                  if (value != null) {
                                                    redTimeOff = value;
                                                  } else {
                                                    redTimeOff = 1.0;
                                                  }
                                                });

                                              }
                                            });
                                          },
                                          onLongPress: () {},
                                          child: const Center(
                                              child: Text(
                                                "3",
                                                style: TextStyle(color: Colors.black),
                                              ))),
                                    ))),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: preset4 ? Colors.blue : Colors.black26),
                                      height: 60.0,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {

                                                preset4 = !preset4;

                                              if (preset4) {

                                                preset1 = false;
                                                preset2 = false;
                                                preset3 = false;
                                                preset5 = false;
                                                preset6 = false;

                                                getPrefPreset("pres4_Green_On").then((value) {
                                                  if (value != null) {
                                                    greenTimeOn = value;
                                                  } else {
                                                    greenTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres4_Green_Off").then((value) {
                                                  if (value != null) {
                                                    greenTimeOff = value;
                                                  } else {
                                                    greenTimeOff = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres4_Red_On").then((value) {
                                                  if (value != null) {
                                                    redTimeOn = value;
                                                  } else {
                                                    redTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres4_Red_Off").then((value) {
                                                  if (value != null) {
                                                    redTimeOff = value;
                                                  } else {
                                                    redTimeOff = 1.0;
                                                  }
                                                });

                                              }
                                            });
                                          },
                                          onLongPress: () {},
                                          child: const Center(
                                              child: Text(
                                                "4",
                                                style: TextStyle(color: Colors.black),
                                              ))),
                                    ))),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: preset5 ? Colors.blue : Colors.black26),
                                      height: 60.0,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {

                                                preset5 = !preset5;

                                              if (preset5) {

                                                preset2 = false;
                                                preset3 = false;
                                                preset4 = false;
                                                preset1 = false;
                                                preset6 = false;

                                                getPrefPreset("pres5_Green_On").then((value) {
                                                  if (value != null) {
                                                    greenTimeOn = value;
                                                  } else {
                                                    greenTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres5_Green_Off").then((value) {
                                                  if (value != null) {
                                                    greenTimeOff = value;
                                                  } else {
                                                    greenTimeOff = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres5_Red_On").then((value) {
                                                  if (value != null) {
                                                    redTimeOn = value;
                                                  } else {
                                                    redTimeOn = 1.0;
                                                  }
                                                });

                                                getPrefPreset("pres5_Red_Off").then((value) {
                                                  if (value != null) {
                                                    redTimeOff = value;
                                                  } else {
                                                    redTimeOff = 1.0;
                                                  }
                                                });

                                              }
                                            });
                                          },
                                          onLongPress: () {},
                                          child: const Center(
                                              child: Text(
                                                "5",
                                                style: TextStyle(color: Colors.black),
                                              ))),
                                    ))),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: preset6 ? Colors.blue : Colors.black26),
                                      height: 60.0,
                                      child: TextButton(
                                          onPressed: () { setState(() {

                                              preset6 = !preset6;

                                            if (preset5) {

                                              preset2 = false;
                                              preset3 = false;
                                              preset4 = false;
                                              preset5 = false;
                                              preset1 = false;

                                              getPrefPreset("pres6_Green_On").then((value) {
                                                if (value != null) {
                                                  greenTimeOn = value;
                                                } else {
                                                  greenTimeOn = 1.0;
                                                }
                                              });

                                              getPrefPreset("pres6_Green_Off").then((value) {
                                                if (value != null) {
                                                  greenTimeOff = value;
                                                } else {
                                                  greenTimeOff = 1.0;
                                                }
                                              });

                                              getPrefPreset("pres6_Red_On").then((value) {
                                                if (value != null) {
                                                  redTimeOn = value;
                                                } else {
                                                  redTimeOn = 1.0;
                                                }
                                              });

                                              getPrefPreset("pres6_Red_Off").then((value) {
                                                if (value != null) {
                                                  redTimeOff = value;
                                                } else {
                                                  redTimeOff = 1.0;
                                                }
                                              });

                                            }
                                          });},
                                          onLongPress: () {},
                                          child: const Center(
                                              child: Text(
                                                "6",
                                                style: TextStyle(color: Colors.black),
                                              ))),
                                    ))),
                            const SizedBox(width: 5.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.black26),
                                height: 40.0,
                                width: 150.0,
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        greenTimeOff = 1.0;
                                        greenTimeOn = 1.0;
                                        redTimeOn = 1.0;
                                        redTimeOff = 1.0;
                                      });

                                    },
                                    child: const Center(
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(color: Colors.black),
                                        ))),
                              )),
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.black26),
                                height: 40.0,
                                width: 150.0,
                                child: TextButton(
                                    onPressed: () {
                                      if (preset1) {
                                        setPrefNewPreset("pres1_Green_On", greenTimeOn);
                                        setPrefNewPreset("pres1_Green_Off", greenTimeOff);
                                        setPrefNewPreset("pres1_Red_On", redTimeOn);
                                        setPrefNewPreset("pres1_Red_Off", redTimeOff);
                                      }
                                      if (preset2) {
                                        setPrefNewPreset("pres2_Green_On", greenTimeOn);
                                        setPrefNewPreset("pres2_Green_Off", greenTimeOff);
                                        setPrefNewPreset("pres2_Red_On", redTimeOn);
                                        setPrefNewPreset("pres2_Red_Off", redTimeOff);
                                      }
                                      if (preset3) {
                                        setPrefNewPreset("pres3_Green_On", greenTimeOn);
                                        setPrefNewPreset("pres3_Green_Off", greenTimeOff);
                                        setPrefNewPreset("pres3_Red_On", redTimeOn);
                                        setPrefNewPreset("pres3_Red_Off", redTimeOff);
                                      }
                                      if (preset4) {
                                        setPrefNewPreset("pres4_Green_On", greenTimeOn);
                                        setPrefNewPreset("pres4_Green_Off", greenTimeOff);
                                        setPrefNewPreset("pres4_Red_On", redTimeOn);
                                        setPrefNewPreset("pres4_Red_Off", redTimeOff);
                                      }
                                      if (preset5) {
                                        setPrefNewPreset("pres5_Green_On", greenTimeOn);
                                        setPrefNewPreset("pres5_Green_Off", greenTimeOff);
                                        setPrefNewPreset("pres5_Red_On", redTimeOn);
                                        setPrefNewPreset("pres5_Red_Off", redTimeOff);
                                      }
                                      if (preset6) {
                                        setPrefNewPreset("pres6_Green_On", greenTimeOn);
                                        setPrefNewPreset("pres6_Green_Off", greenTimeOff);
                                        setPrefNewPreset("pres6_Red_On", redTimeOn);
                                        setPrefNewPreset("pres6_Red_Off", redTimeOff);
                                      }

                                    },
                                    child: const Center(
                                        child: Text(
                                          "Save",
                                          style: TextStyle(color: Colors.black),
                                        ))),
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
