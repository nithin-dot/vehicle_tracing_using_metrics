import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flood Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tracing System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final databaseReference = FirebaseDatabase.instance.ref();
  static var rawdata = {};
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    databaseReference.child('Vehicle').once().then((dataSnapshot) async {
      // var name = dataSnapshot.snapshot.value.toString();

      Map<dynamic, dynamic> values = dataSnapshot.snapshot.value as Map;
      values.forEach((key, values) {
        setState(() {
          list.add(key);
        });
      });
      setState(() {
        rawdata = dataSnapshot.snapshot.value as Map;
        // print(rawdata);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(widget.title),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(list.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Card(
                  color: const Color.fromARGB(255, 235, 237, 237),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsReceiver(vehicleid: list[index], to:rawdata[list[index]]['to']
                                                    .toString(), from:rawdata[list[index]]['from']
                                                    .toString(),tk:rawdata[list[index]]['TK']
                                                    .toString(),carry:rawdata[list[index]]['carry']
                                                    .toString(),mi:rawdata[list[index]]['mi']
                                                    .toString(),ser:rawdata[list[index]]['ser']
                                                    .toString(),cur:rawdata[list[index]]['cur']
                                                    .toString())),
                    );
                      },
                      splashColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(list[index]),
                                ],
                              ),
                              SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset("images/truckfront.png")),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Fuel Usage',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                              IconData(0xea8e,
                                                  fontFamily: 'MaterialIcons'),
                                              size: 12.0,
                                              color: Colors.black),
                                          Text(
                                            rawdata[list[index]]['L']
                                                    .toString() +
                                                "L",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Kilo Meter',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                              IconData(0xe41e,
                                                  fontFamily: 'MaterialIcons'),
                                              size: 12.0,
                                              color: Colors.black),
                                          Text(
                                            rawdata[list[index]]['KM']
                                                    .toString() +
                                                "KM",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
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
                  ),
                  elevation: 1,
                ),
              );
            })));
  }
}
