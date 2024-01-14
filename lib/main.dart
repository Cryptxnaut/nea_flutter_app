import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

void main() {
  runApp(const JoystickExampleApp());
}

const ballSize = 20.0;
const step = 10.0;

class JoystickExampleApp extends StatelessWidget {
  const JoystickExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Joystick Example'),
        ),
        body: const JoystickExample(),
      ),
    );
  }
}

class JoystickExample extends StatefulWidget {
  const JoystickExample({Key? key}) : super(key: key);

  @override
  State<JoystickExample> createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<JoystickExample> {
  double _x1 = 100;
  double _y1 = 100;
  double _x2 = 300;
  double _y2 = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 238, 241),
      appBar: AppBar(
        title: const Text('Dual Joysticks'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Ball(_x1, _y1),
            Ball(_x2, _y2),
            Align(
              alignment: const Alignment(-0.3, 0),
              child: Joystick(
                listener: (details) {
                  setState(() {
                    _x1 = _x1 + step * details.x;
                    _y1 = _y1 + step * details.y;
                  });
                },
              ),
            ),
            Align(
              alignment: const Alignment(0.3, 0),
              child: Joystick(
                listener: (details) {
                  setState(() {
                    _x2 = _x2 + step * details.x;
                    _y2 = _y2 + step * details.y;
                  });
                },
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press for joystick 1
                      print('Button 1 Pressed on Joystick 1');
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    child: const Text('Button 1', style: TextStyle(color: Colors.amber)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press for joystick 1
                      print('Button 2 Pressed on Joystick 1');
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    child: const Text('Button 2', style: TextStyle(color: Colors.amber)),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.8, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press for joystick 2
                      print('Button 3 Pressed on Joystick 2');
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    child: const Text('Button 3', style: TextStyle(color: Colors.amber)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press for joystick 2
                      print('Button 4 Pressed on Joystick 2');
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    child: const Text('Button 4', style: TextStyle(color: Colors.amber)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball(this.x, this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: ballSize,
        height: ballSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
      ),
    );
  }
}
