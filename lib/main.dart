import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_radio/flutter_radio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String url = "http://criturkfm.aa.net.tr:2200/;stream.mp3";

  bool isPlaying = false;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cri Türk FM 103.7 İzmir',
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Cri Türk FM 103.7 İzmir'),
            backgroundColor: Colors.blueGrey.shade900,
            centerTitle: true,
          ),
          body: Container(
            color: Colors.blueGrey.shade900,
            child: new Column(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Icon(
                      Icons.radio, size: 250,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: IconButton(icon: isPlaying? Icon(
                          Icons.pause_circle_outline,
                          size: 80,
                          color: Colors.white,
                        )
                            : Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 80,
                        ),
                            onPressed: (){
                          setState(() {
                            FlutterRadio.play(url: url);
                            isPlaying = !isPlaying;
                            isVisible = !isVisible;
                          });
                            },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
            ),
          ),
        ));
  }
}