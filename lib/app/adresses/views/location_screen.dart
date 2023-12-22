import 'package:application/packages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final latLng = Get.arguments as LatLng;

  Set<Marker> markers = <Marker>{};

  Marker? marker;

  void _addNewMarker() {
    marker = Marker(
      markerId: const MarkerId('0'),
      position: latLng,

    );

    setState(() {
      markers.add(marker!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Location'.tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: latLng,
                  zoom: 18.0,
                ),

                onMapCreated: (googleMapController) => _addNewMarker(),
                markers: markers,

                //settings for scrolling
                scrollGesturesEnabled: false,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
