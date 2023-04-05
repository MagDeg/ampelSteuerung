import 'package:flutter/material.dart';

class ManualControl extends StatefulWidget {
  const ManualControl({Key? key}) : super(key: key);

  @override
  State<ManualControl> createState() => _ManualControlState();
}

class _ManualControlState extends State<ManualControl> {

  bool green = false;
  bool red = false;

  bool active = false;



  @override
  Widget build(BuildContext context) {
    return Container(
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
                  const Expanded(child:  Text('Manueller Modus', style: TextStyle(fontSize: 17),)),
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
    );
  }
}
