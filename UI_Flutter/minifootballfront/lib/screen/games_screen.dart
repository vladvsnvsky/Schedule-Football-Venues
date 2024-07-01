import 'package:flutter/material.dart';
import 'package:minifootballfront/matchfilters.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/matchfiltersscreen.dart';
import 'package:minifootballfront/screen/my_widgets/game_card.dart';
import 'package:minifootballfront/screen/my_widgets/my_custom_appbar.dart';
import 'package:minifootballfront/service/matchservice.dart';

import '../service/BearerAuthentication.dart';
import '../service/tokenservice.dart';
import '../service/userentityservice.dart';
import '../uihelper.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  MatchApi? _api;
  BearerAuthentication? _auth;
  ApiClient? _apiClient;

  List<GameDetailsDTO>? _games;

  MatchFilters? _filters;

  int currentPage = 1;
  int totalPages = 1;
  String filterType = 'active';
  String sortType = 'date';

  bool isLoading = true;
  bool _clientIsAdmin = false;

  double? budget;

  @override
  void initState() {
    super.initState();
    authorizeUser();
  }

  UserEntityDTO? user;
  authorizeUser() async {
    var jwt = await TokenService().getToken();
    _auth = BearerAuthentication(jwt!);
    _apiClient = ApiClient(authentication: _auth);
    _api = MatchApi(_apiClient);
    user = await UserService(jwt: jwt).getUserEntity();

    var roles = TokenService().getRoles(jwt);

    if (roles != null)
      for (var role in roles) {
        if (role == 'ADMIN')
          setState(() {
            _clientIsAdmin = true;
          });
      }

    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      int? budgetUnits;
      if (user != null) {
        budgetUnits = user!.budgetUnits ?? 0;
      }

      double amountInDollars = budgetUnits!.toDouble() / 100;

      GameDetailsDTOPaginatedResponse? response;
      if (_filters != null) {
        response = await MatchService(jwt: (await TokenService().getToken())!)
            .getMatchesByFiltersPaginated(currentPage, 6, _filters!);
      } else {
        response = await _api!.matchGetAllActiveByStartTimePaginatorGet(
            pageNumber: currentPage, pageSize: 6);
      }

      if (response == null) throw Exception("No games found!");

      setState(() {
        _games = response!.items;
        budget = amountInDollars;
        currentPage = response.currentPage!;
        totalPages = response.totalPages!;
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      if (mounted)
        MyUiHelper.showSnackBar(context, e.toString(), Colors.red[600]!);
    }
  }

  void _nextPage() {
    if (currentPage < totalPages) {
      setState(() {
        currentPage++;
      });
      _fetchData();
    }
  }

  void _previousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
      });
      _fetchData();
    }
  }

  void _changeFilter(String type) {
    setState(() {
      filterType = type;
      isLoading = true;
    });
    _fetchData();
  }

  void _changeSort(String type) {
    setState(() {
      sortType = type;
      isLoading = true;
    });
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        title: 'Games',
        budget: budget,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _games?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GameCard(
                        gameDetails: _games?[index],
                        adminView: _clientIsAdmin,
                      );
                    },
                  ),
                ),
                _buildPaginationControls(),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                if (_filters == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MatchFiltersScreen(
                              filtersSelected: _setFilters,
                            )),
                  );
                } else {
                  setState(() {
                    _filters = null;
                  });
                  _fetchData();
                }
              },
              child: Text(_filters == null ? 'Open filters' : 'Reset filter'),
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

  Widget _buildPaginationControls() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: currentPage > 1 ? _previousPage : null,
              child: Text("Previous")),
          Text("Page $currentPage of $totalPages"),
          ElevatedButton(
              onPressed: currentPage < totalPages ? _nextPage : null,
              child: Text("Next")),
        ],
      ),
    );
  }

  void _setFilters(MatchFilters filters) async {
    setState(() {
      _filters = filters;
      currentPage = 1; // Reset to first page when filtering
    });
    _fetchData();
  }
}
