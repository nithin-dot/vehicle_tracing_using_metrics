import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'map.dart';

class DetailsReceiver extends StatefulWidget {
  final String vehicleid;
  final String to;
  final String from;
  final String tk;
  final String carry;
  final String mi;
  final String ser;
  final String cur;
  const DetailsReceiver(
      {Key? key,
      required this.vehicleid,
      required this.to,
      required this.from,
      required this.tk,
      required this.carry,
      required this.mi,
      required this.ser,
      required this.cur})
      : super(key: key);
  @override
  State createState() => DetailsReceiverState();
}

class DetailsReceiverState extends State<DetailsReceiver> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 2.0,
              backgroundColor: Colors.white,
              title: Text(widget.vehicleid,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0)),
            ),
            body: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 29.0),
              children: <Widget>[
                _buildTile(
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Builder(builder: (context) {
                                  return const HomePage();
                                })),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\t\t" + widget.to,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24.0))
                              ],
                            ),
                            const Text("TO",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0)),
                            Text(widget.from + "\t",
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24.0)),
                            // Material(
                            //     color: Colors.blue,
                            //     borderRadius: BorderRadius.circular(24.0),
                            //     child: const Center(
                            //         child: Padding(
                            //       padding: EdgeInsets.all(16.0),
                            //       child: Text(
                            //         "33509 KM",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 30,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     )))
                          ]),
                    ),
                  ),
                  onTap: () {},
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              // Text('Total Views',
                              //     style: TextStyle(color: Colors.blueAccent)),

                              Icon(
                                  IconData(0xe410, fontFamily: 'MaterialIcons'),
                                  size: 32.0,
                                  color: Colors.black),

                              Text("TOTAL TRAVELED ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0))
                            ],
                          ),
                          Material(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24.0),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.tk,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )))
                        ]),
                  ),
                  onTap: () {},
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: Colors.red[400],
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.mi,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Row(
                            children: const [
                              Text('Mileage',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0)),
                              Icon(Icons.local_gas_station,
                                  color: Colors.redAccent, size: 30.0),
                            ],
                          ),
                        ]),
                  ),
                  onTap: () {},
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: Colors.orange[400],
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.ser,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Row(
                            children: [
                              const Text('Services',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0)),
                              Icon(Icons.local_car_wash,
                                  color: Colors.orange[200], size: 25.0),
                            ],
                          ),
                        ]),
                  ),
                  onTap: () {},
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              // Text('Total Views',
                              //     style: TextStyle(color: Colors.blueAccent)),

                              Icon(
                                  IconData(0xe3a6, fontFamily: 'MaterialIcons'),
                                  size: 32.0,
                                  color: Colors.black),

                              Text("Carrying ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.0))
                            ],
                          ),
                          Material(
                              color: const Color.fromARGB(255, 4, 11, 16),
                              borderRadius: BorderRadius.circular(24.0),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.carry,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )))
                        ]),
                  ),
                  onTap: () {},
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Material(
                                      color: Colors.blueGrey[200],
                                      shape: const CircleBorder(),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                            IconData(0xe46a,
                                                fontFamily: 'MaterialIcons'),
                                            color: Colors.white,
                                            size: 20.0),
                                      )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text("Selling Price Value",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0)),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0, top: 25.0),
                                        child: Text('₹ ' + widget.cur + '0',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 33, 245, 110),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 40.0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                  onTap: () => {},
                )
              ],
              // ignore: prefer_const_literals_to_create_immutables
              staggeredTiles: [
                const StaggeredTile.extent(5, 110.0),
                const StaggeredTile.extent(5, 110.0),
                const StaggeredTile.extent(1, 180.0),
                const StaggeredTile.extent(1, 180.0),
                const StaggeredTile.extent(5, 110.0),
                const StaggeredTile.extent(2, 200.0),
              ],
            )));
  }

  Widget _buildTile(Widget child, {required Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: const Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            // ignore: unnecessary_null_comparison
            onTap: onTap != null
                ? () => onTap()
                : () {
                    // ignore: avoid_print
                    print('Not set yet');
                  },
            child: child));
  }
}
