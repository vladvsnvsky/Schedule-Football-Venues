import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/users_screen.dart';
import 'package:minifootballfront/service/matchservice.dart';
import 'package:minifootballfront/service/signalr_service.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/uihelper.dart';

const Map<int, String> gameTypeDescriptions = {
  10: "5-a side",
  12: "6-a side",
  14: "7-a side",
  16: "8-a side",
  18: "9-a side",
  20: "10-a side",
  22: "11-a side",
};

class GameCard extends StatefulWidget {
  final GameDetailsDTO? gameDetails;
  final bool previewMode;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function(Response)? onJoinActionDone;
  final Function(Response)? onCancelActionDone;
  final Function(Response)? onLeaveActionDone;
  final bool? adminView;

  GameCard(
      {Key? key,
      required this.gameDetails,
      this.previewMode = false,
      this.backgroundColor,
      this.foregroundColor,
      this.onJoinActionDone,
      this.onCancelActionDone,
      this.onLeaveActionDone,
      this.adminView = false})
      : super(key: key);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  late TokenService ts;
  late SignalRService _signalRService;
  Color? _backgroundColor;
  Color? _foregroundColor;
  GameDetailsDTO? _currentGameState;
  List<GameDetailsDTO>? myMatches = [];
  bool _isExpanded = false;
  bool _joinButtonVisible = false;
  bool _cancelButtonVisible = false;
  bool _leaveButtonVisible = false;
  int _currentNumberOfPlayers = 0;
  double? _displayedPrice;
  bool isLoading = true;
  String? token;

  @override
  void initState() {
    super.initState();
    ts = TokenService();
    _signalRService = SignalRService();
    _initializeState();
  }

  @override
  void dispose() {
    _signalRService.stopConnection();
    super.dispose();
  }

  Future<void> _initializeState() async {
    setState(() => isLoading = true);
    try {
      var jwt = await ts.getToken();
      token = jwt;
      if (jwt == null) throw Exception("JWT is null");

      _currentNumberOfPlayers = widget.gameDetails?.currentNumberOfPlayers ?? 0;
      _displayedPrice =
          (widget.gameDetails?.pricePerPlayerUnits!.toDouble())! / 100;

      _signalRService.startConnection().then((_) {
        _signalRService.onPlayerCountUpdated((gameId, newPlayerCount) {
          if (gameId == widget.gameDetails?.id) {
            setState(() => _currentNumberOfPlayers = newPlayerCount);
          }
        });
      });

      _currentGameState = widget.gameDetails;
      await _loadUserData(jwt);
      await _completeGameData(jwt);

      _backgroundColor = widget.backgroundColor;
      _foregroundColor = widget.foregroundColor;

      setState(() => isLoading = false);
    } catch (e) {
      print("Error initializing state: $e");
      setState(() => isLoading = false);
    }
  }

  Future<void> _loadUserData(String jwt) async {
    try {
      var matchesList = await MatchService(jwt: jwt).getMatchesByPlayer();
      setState(() => myMatches = matchesList);
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  Future<void> _completeGameData(String jwt) async {
    try {
      int? gameId = _currentGameState?.id;
      if (gameId == null) {
        _setDataFromToken(jwt);
      } else {
        await _setDataFromDatabase(jwt);
      }
    } catch (e) {
      print("Error completing game data: $e");
    }
  }

  void _setDataFromToken(String jwt) {
    try {
      _currentGameState?.organizerName = ts.getUsername(jwt);
    } catch (e) {
      print("Error setting data from token: $e");
    }
  }

  Future<void> _setDataFromDatabase(String jwt) async {
    try {
      var result = await MatchService(jwt: jwt)
          .getMatchDetailsById(_currentGameState!.id!);
      if (result != null) {
        setState(() => _currentGameState = result);
      }
    } catch (e) {
      print("Error setting data from database: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : _buildCard();
  }

  Widget _buildCard() {
    _setCardColors();
    _setVisibility();

    return Card(
      elevation: 4.0,
      color: _backgroundColor,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          _buildListTile(
            title: _buildCardTitle(),
            subtitle: _buildCardSubtitle(),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildExpandedSection(),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  void _setCardColors() {
    if (_currentGameState?.isCancelled == true) {
      _backgroundColor = Colors.blueGrey;
      _foregroundColor = Colors.white;
    } else if (_currentGameState?.finished == true) {
      _backgroundColor = Colors.greenAccent;
      _foregroundColor = Colors.black;
    }
  }

  String _buildCardTitle() {
    int day = _currentGameState?.day ?? 0;
    int month = _currentGameState?.month ?? 0;
    int year = _currentGameState?.year ?? 0;
    int startHour = _currentGameState?.startHour ?? 0;
    int endHour = _currentGameState?.endHour ?? 0;
    String formattedStartHour = startHour.toString().padLeft(2, '0');
    String formattedEndHour = endHour.toString().padLeft(2, '0');
    String formattedDay = day.toString().padLeft(2, '0');
    String formattedMonth = month.toString().padLeft(2, '0');
    String dateString = "$formattedDay.$formattedMonth.$year";
    return "$formattedStartHour:00 - $formattedEndHour:00 | $dateString | Location: ${_currentGameState?.fieldName ?? "Unknown"}";
  }

  String _buildCardSubtitle() {
    String cardSubtitle =
        "${_currentGameState?.cityName ?? ""}, ${_currentGameState?.countryName ?? ""} | \$${_displayedPrice.toString()}/player";
    if (_currentGameState?.cityName == null ||
        _currentGameState?.countryName == null) {
      cardSubtitle = "\$${_displayedPrice}/player";
    }
    if (_currentGameState?.finished == true) {
      cardSubtitle += ' | This game is finished';
    }
    if (_currentGameState?.isCancelled == true) {
      cardSubtitle += ' | This game has been cancelled';
    } else {
      cardSubtitle +=
          ' | ${_currentNumberOfPlayers}/${widget.gameDetails?.nrOfPlayersRequired ?? 0} spots';
    }
    return cardSubtitle;
  }

  void _setVisibility() {
    String? currentUsername = ts.getUsername(token!);
    if (!widget.previewMode) {
      _cancelButtonVisible =
          _currentGameState?.organizerName == currentUsername ||
              widget.adminView == true;
      _leaveButtonVisible =
          _currentGameState?.organizerName != currentUsername &&
              myMatches!.any((match) => match.id == _currentGameState?.id);
      _joinButtonVisible =
          _currentGameState?.organizerName != currentUsername &&
              (_currentGameState?.nrOfPlayersRequired ?? 0) -
                      (_currentGameState?.currentNumberOfPlayers ?? 0) >
                  0 &&
              !myMatches!.any((match) => match.id == _currentGameState?.id);
    } else {
      _joinButtonVisible = false;
      _cancelButtonVisible = false;
      _leaveButtonVisible = false;
    }
  }

  Widget _buildListTile({required String title, required String subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        if (widget.gameDetails?.isCancelled != true &&
            widget.gameDetails?.finished != true) {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        }
      },
    );
  }

  Widget _buildExpandedSection() {
    int day = _currentGameState?.day ?? 0;
    int month = _currentGameState?.month ?? 0;
    int year = _currentGameState?.year ?? 0;
    int startHour = _currentGameState?.startHour ?? 0;
    int endHour = _currentGameState?.endHour ?? 0;
    String formattedStartHour = startHour.toString().padLeft(2, '0');
    String formattedEndHour = endHour.toString().padLeft(2, '0');
    String formattedDay = day.toString().padLeft(2, '0');
    String formattedMonth = month.toString().padLeft(2, '0');
    String dateString = "$formattedDay.$formattedMonth.$year";
    String organizerName = _currentGameState?.organizerName ?? "N/A";
    String gameTypeName =
        gameTypeDescriptions[_currentGameState?.nrOfPlayersRequired ?? 0] ??
            "Unknown";

    return Column(
      children: [
        Divider(),
        ListTile(
          title: Text("Organizer: $organizerName"),
          subtitle: Text("Game Type: $gameTypeName"),
        ),
        ListTile(
          title: Text("Date: $dateString"),
          subtitle: Text("Time: $formattedStartHour:00 - $formattedEndHour:00"),
        ),
        ListTile(
          title: Text(
              "Players: ${_currentNumberOfPlayers}/${widget.gameDetails?.nrOfPlayersRequired ?? 0}"),
        ),
        ListTile(
          title: Text("Price per Player: \$${_displayedPrice ?? "N/A"}"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_cancelButtonVisible) _buildActionButton("Cancel", _cancelGame),
            SizedBox(
              width: 10,
            ),
            if (_leaveButtonVisible) _buildActionButton("Leave", _leaveGame),
            SizedBox(
              width: 10,
            ),
            if (_joinButtonVisible) _buildActionButton("Join", _joinGame),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        TextButton(onPressed: _seePlayers, child: Text('Check players'))
      ],
    );
  }

  Widget _buildActionButton(String text, Function() onPressed) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }

  Future<void> _cancelGame() async {
    try {
      var response = await MatchService(jwt: token!)
          .cancelGame(_currentGameState?.id ?? 0, "");
      widget.onCancelActionDone?.call(response);
      await _completeGameData(token!);
    } catch (e) {
      print("Error cancelling game: $e");
    }
  }

  Future<void> _leaveGame() async {
    try {
      var response =
          await MatchService(jwt: token!).leaveGame(_currentGameState?.id ?? 0);
      widget.onLeaveActionDone?.call(response);
      await _completeGameData(token!);
    } catch (e) {
      print("Error leaving game: $e");
    }
  }

  Future<void> _joinGame() async {
    double price = (_currentGameState!.pricePerPlayerUnits!.toDouble()) / 100;

    bool userConfirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirm Join Game'),
              content:
                  Text('By joining this game you will be charged \$$price'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false); // User pressed Cancel
                  },
                ),
                TextButton(
                  child: Text('Join'),
                  onPressed: () {
                    Navigator.of(context).pop(true); // User pressed Join
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

    try {
      var response =
          await MatchService(jwt: token!).joinGame(_currentGameState?.id ?? 0);
      if (response.statusCode != 200) throw Exception(response.body);
      widget.onJoinActionDone?.call(response);
      await _completeGameData(token!);
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  void _seePlayers() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UsersScreen.forMatch(
                matchId: widget.gameDetails!.id,
              )),
    );
  }
}
