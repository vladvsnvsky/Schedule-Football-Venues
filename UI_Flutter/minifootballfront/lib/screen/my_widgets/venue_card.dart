import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/googlemaps/mapvenue.dart';

class VenueCard extends StatefulWidget {
  final VenueDetailsDTO venueInfo;
  final List<Widget>? actions;
  const VenueCard({Key? key, required this.venueInfo, this.actions})
      : super(key: key);

  @override
  _VenueCardState createState() => _VenueCardState();
}

class _VenueCardState extends State<VenueCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          widget.venueInfo.isActive == false ? Colors.grey[500] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.venueInfo.name!,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.venueInfo.description ?? '',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 2),
            Text(
              widget.venueInfo.cityName!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price per hour: \$${(widget.venueInfo.pricePerHourUnits!.toDouble() / 100)}',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            if (_isExpanded) ...[
              Divider(),
              Text(
                'Email: ${widget.venueInfo.email ?? "N/A"}',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
              ),
              Text(
                'Phone: ${widget.venueInfo.phone ?? "N/A"}',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
              ),
              Text(
                'Address: ${widget.venueInfo.streetAndNo ?? "N/A"}, ${widget.venueInfo.cityName}',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
              ),
              Text(
                'Capacity: ${widget.venueInfo.capacity ?? "N/A"}',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
              ),
              Text(
                'Dimensions: ${widget.venueInfo.width ?? "N/A"}m x ${widget.venueInfo.length ?? "N/A"}m',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
              ),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(_isExpanded ? 'Show Less' : 'Show More'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapVenue(venue: widget.venueInfo)),
                        );
                      },
                      child: Text('Check Location'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: widget.actions ?? [],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
