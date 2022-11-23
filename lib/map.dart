import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// created controller for displaying Google Maps
  final Completer<GoogleMapController> _controller = Completer();

// given camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(11.2192208, 78.1677374),
    zoom: 15,
  );

  Uint8List? marketimages;
  List<String> images = ['images/truckfront.png'];

// created empty list of markers
  final List<Marker> _markers = <Marker>[];

// created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[
    const LatLng(11.2192208, 78.1677374),
  ];

// declared method to get Images
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    // initialize loadData method
    loadData();
  }

// created method for displaying custom markers according to index
  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(Marker(
        // given marker id
        markerId: MarkerId(i.toString()),
        // given marker icon
        icon: BitmapDescriptor.fromBytes(markIcons),
        // given position
        position: _latLen[i],
        infoWindow: InfoWindow(
          // given title for marker
          title: 'Location: ' + i.toString(),
        ),
      ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          // given camera position
          initialCameraPosition: _kGoogle,
          // set markers on google map
          markers: Set<Marker>.of(_markers),
          // on below line we have given map type
          mapType: MapType.normal,
          // on below line we have enabled location
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // on below line we have enabled compass
          compassEnabled: true,
          // below line displays google map in our app
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
