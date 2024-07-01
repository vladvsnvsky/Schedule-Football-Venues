import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/my_widgets/game_card.dart';
import 'package:minifootballfront/service/matchservice.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/service/venue_service.dart';
import 'package:minifootballfront/uihelper.dart';

class GameSummaryScreen extends StatefulWidget {
  final GameDetailsDTO gameDetails;
  final Function()? cancelButtonClicked;

  GameSummaryScreen(
      {Key? key, required this.gameDetails, this.cancelButtonClicked})
      : super(key: key);

  @override
  _GameSummaryScreen createState() => _GameSummaryScreen();
}

class _GameSummaryScreen extends State<GameSummaryScreen> {
  GameDetailsDTO? _currentGameState;
  bool _isLoading = true;
  MyUiHelper uiHelper = MyUiHelper();
  final TokenService ts = TokenService();

  @override
  void initState() {
    super.initState();
    _currentGameState = widget.gameDetails;
    _loadDataRequired();
  }

  Future<void> _loadDataRequired() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String? token = await ts.getToken();
      if (token == null) throw Exception("No token found");

      var decodedToken = ts.decodeToken(token);
      if (decodedToken == null) throw Exception("Failed to decode token");

      String usernameFromToken = ts.getUsername(token) ?? "Unknown User";

      var fieldId = _currentGameState?.fieldId;
      if (fieldId == null) throw Exception("Field ID is null");

      var field = await VenueService().getVenueDetailsById(fieldId);

      setState(() {
        _currentGameState?.fieldName = field.name;
        _currentGameState?.organizerName = usernameFromToken;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading data: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ));
    } catch (e) {
      print("Error showing snackbar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (_isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          appBar: AppBar(title: Text("Review your game's details")),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (_currentGameState != null)
                  GameCard(
                    gameDetails: _currentGameState!,
                    previewMode: true,
                  )
                else
                  const Text("Game details are not available."),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    if (widget.cancelButtonClicked != null)
                      ElevatedButton(
                        onPressed: widget.cancelButtonClicked,
                        child: const Text("Cancel"),
                      ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          String? token = await ts.getToken();
                          double price = _currentGameState!.pricePerPlayerUnits!
                                  .toDouble() /
                              100;
                          bool userConfirmed = await showDialog<bool>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirm Join Game'),
                                    content: Text(
                                        'By creating this game you will be charged \$$price'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop(
                                              false); // User pressed Cancel
                                        },
                                      ),
                                      TextButton(
                                        child: Text('Create'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(true); // User pressed Join
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;

                          if (!userConfirmed) {
                            return; // If user cancels, do nothing
                          }
                          if (token != null) {
                            int statusCode = await MatchService(jwt: token)
                                .postMatchGameDetails(widget.gameDetails);
                            if (statusCode == 200) {
                              _showSnackBar(
                                  "Game Created!", Colors.green[600]!);
                            } else {
                              _showSnackBar(
                                  "Something went wrong!", Colors.red[600]!);
                            }
                          } else {
                            _showSnackBar(
                                "Try to reauthenticate!", Colors.red[600]!);
                            throw Exception('Authentication token is null.');
                          }
                        } catch (e) {
                          _showSnackBar(e.toString(), Colors.red[600]!);
                        }
                      },
                      child: const Text("Publish game!"),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      print("Error building widget: $e");
      return const Center(child: Text("An error occurred."));
    }
  }
}
