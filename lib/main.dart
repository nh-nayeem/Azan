import 'package:azan1/scheduleazan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Azan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title)
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),
          width: 200,
          height: 80,
          child: ElevatedButton(
            onPressed: () async{
              List<String> ss = (await scheduleazan.todaysSchedule()) as List<String>;
              showDialog(
                context: context, 
                builder: (context) {
                  return Container(
                    child: AlertDialog(
                      title: Text('Time'),
                      content:  SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(ss[0], textScaleFactor: 1.6),
                            Text(ss[1], textScaleFactor: 1.5),
                            Text(ss[2], textScaleFactor: 1.6),
                            Text(ss[3], textScaleFactor: 1.5),
                            Text(ss[4], textScaleFactor: 1.6),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              );
            }, child: Text("click"),
          ),
        ),
      ),
    );
  }
}
