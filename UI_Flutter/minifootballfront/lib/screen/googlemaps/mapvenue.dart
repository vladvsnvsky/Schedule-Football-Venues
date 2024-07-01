import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class MapVenue extends StatefulWidget {
  final VenueDetailsDTO? venue;

  const MapVenue({super.key, this.venue});

  @override
  _MapVenueState createState() => _MapVenueState();
}

class _MapVenueState extends State<MapVenue> {
  Completer<GoogleMapController> _controller = Completer();
  late LatLng _center;

  @override
  void initState() {
    super.initState();
    if (widget.venue != null) {
      _center = LatLng(
        widget.venue!.latitude ?? 0,
        widget.venue!.longitude ?? 0,
      );
    } else {
      _center = LatLng(0, 0); // Fallback location if venue is null
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.venue == null ||
        widget.venue!.latitude == null ||
        widget.venue!.longitude == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Check map"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.venue!.name ?? "Check map"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('destinationLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(widget.venue!.latitude!, widget.venue!.longitude!),
          ),
        },
      ),
    );
  }
}
