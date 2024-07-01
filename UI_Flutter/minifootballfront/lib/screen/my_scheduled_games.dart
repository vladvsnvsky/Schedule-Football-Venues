import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/matchservice.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'create_game_screen.dart';
import 'my_widgets/game_card.dart';

class MyScheduledGamesScreen extends StatefulWidget {
  @override
  _MyScheduledGamesScreenState createState() => _MyScheduledGamesScreenState();
}

class _MyScheduledGamesScreenState extends State<MyScheduledGamesScreen> {
  List<GameDetailsDTO> matches = [];
  bool isLoading = true;
  int currentPage = 1;
  int totalPages = 1;
  final int pageSize = 6;
  TokenService ts = TokenService();
  String? token;
  String filterType = 'active';
  String sortType = 'date';

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadMyScheduledGames();
  }

  Future<void> _loadUserData() async {
    token = await ts.getToken();
  }

  Future<void> _loadMyScheduledGames() async {
    setState(() => isLoading = true);
    try {
      token = await ts.getToken();
      if (token == null) {
        _showSnackBar("You are not authenticated!", Colors.red);
        setState(() => isLoading = false);
        return;
      }
      var response = await MatchService(jwt: token!)
          .getFilteredAndSortedMatchesByPlayerPaginated(
              currentPage, pageSize, filterType, sortType);
      if (response == null) {
        _showSnackBar(
            "Failed to fetch matches. Please try again later.", Colors.red);
        setState(() => isLoading = false);
        return;
      }
      setState(() {
        matches = response.items!;
        currentPage = response.currentPage!;
        totalPages = response.totalPages!;
        isLoading = false;
      });
    } catch (e) {
      _showSnackBar(e.toString(), Colors.red);
      setState(() => isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void _nextPage() {
    if (currentPage < totalPages) {
      setState(() => currentPage++);
      _loadMyScheduledGames();
    }
  }

  void _previousPage() {
    if (currentPage > 1) {
      setState(() => currentPage--);
      _loadMyScheduledGames();
    }
  }

  void _changeFilter(String type) {
    setState(() {
      filterType = type;
      _loadMyScheduledGames();
    });
  }

  void _changeSort(String type) {
    setState(() {
      sortType = type;
      _loadMyScheduledGames();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Scheduled Games"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateGameScreen.empty()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(child: buildContent()),
                _buildPaginationControls(),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PopupMenuButton<String>(
              onSelected: _changeFilter,
              itemBuilder: (BuildContext context) {
                return [
                  CheckedPopupMenuItem(
                    checked: filterType == 'none',
                    value: 'none',
                    child: Text('All Games'),
                  ),
                  CheckedPopupMenuItem(
                    checked: filterType == 'active',
                    value: 'active',
                    child: Text('Active Games'),
                  ),
                  CheckedPopupMenuItem(
                    checked: filterType == 'finished',
                    value: 'finished',
                    child: Text('Finished Games'),
                  ),
                  CheckedPopupMenuItem(
                    checked: filterType == 'cancelled',
                    value: 'cancelled',
                    child: Text('Cancelled Games'),
                  ),
                ];
              },
              icon: Icon(Icons.filter_list),
            ),
            PopupMenuButton<String>(
              onSelected: _changeSort,
              itemBuilder: (BuildContext context) {
                return [
                  CheckedPopupMenuItem(
                    checked: sortType == 'date',
                    value: 'date',
                    child: Text('Sort by Date'),
                  ),
                  CheckedPopupMenuItem(
                    checked: sortType == 'name',
                    value: 'name',
                    child: Text('Sort by Name'),
                  ),
                ];
              },
              icon: Icon(Icons.sort),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildContent() {
    if (matches.isEmpty) {
      return Center(child: Text('No games available'));
    }

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (BuildContext context, int index) {
        var match = matches[index];
        bool _leaveButtonVisible = true;
        bool _cancelButtonVisible = false;

        if (match.organizerName == ts.getUsername(token!)) {
          DateTime matchDate =
              DateTime(match.year!, match.month!, match.day!, match.startHour!);
          Duration durationUntilMatch = matchDate.difference(DateTime.now());
          _leaveButtonVisible = false;
          if (durationUntilMatch.inHours >= 24 &&
              DateTime.now().isBefore(matchDate)) {
            _cancelButtonVisible = true;
          }
        }

        return GameCard(
          gameDetails: match,
          previewMode: false,
          onJoinActionDone: _handleJoinActionDone,
          onLeaveActionDone: _handleLeaveActionDone,
          onCancelActionDone: _handleCancelActionDone,
        );
      },
    );
  }

  void _handleJoinActionDone(Response value) {
    _showSnackBar(
        value.body, value.statusCode == 200 ? Colors.green : Colors.red);
    _loadMyScheduledGames();
  }

  void _handleLeaveActionDone(Response value) {
    _showSnackBar(
        value.body, value.statusCode == 200 ? Colors.green : Colors.red);
    _loadMyScheduledGames();
  }

  void _handleCancelActionDone(Response value) {
    _showSnackBar(
        value.body, value.statusCode == 200 ? Colors.green : Colors.red);
    _loadMyScheduledGames();
  }

  Widget _buildPaginationControls() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: currentPage > 1 ? _previousPage : null,
            child: Text("Previous"),
          ),
          Text("Page $currentPage of $totalPages"),
          ElevatedButton(
            onPressed: currentPage < totalPages ? _nextPage : null,
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
