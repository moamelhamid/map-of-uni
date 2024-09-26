import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'AL-Nahrain Uni. Map',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 115, 189)),
            ),
          ),
        ),
        body: content());
  }

  Widget content() {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(33.2794445, 44.378028),
        initialZoom: 16.9,
        interactionOptions:
            InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(
          markers: [
            Marker(
                point: const LatLng(33.280084, 44.375086),
                child: GestureDetector(
                  onTap: () {
                    // navtion to screen
                  },
                  child: const Icon(
                    Icons.location_pin,
                    size: 33,
                    color: Colors.red,
                  ),
                ),
                width: 50,
                height: 50,
                alignment: Alignment.center),
            Marker(
                point: const LatLng(33.277599, 44.379208),
                child: GestureDetector(
                  onTap: () {
                    // navtion to screen
                  },
                  child: const Icon(
                    Icons.location_pin,
                    size: 33,
                    color: Colors.red,
                  ),
                ),
                width: 50,
                height: 50,
                alignment: Alignment.center),
          ],
        ),
      ],
    );
  }
}
TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.moamel.flutter_alnharain_uni_map',
    );


// dhfaaaaaaaaaa