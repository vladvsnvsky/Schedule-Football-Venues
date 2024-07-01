import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/my_widgets/my_custom_appbar.dart';
import 'package:minifootballfront/screen/players_filter_screen.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/service/userentityservice.dart';
import 'package:minifootballfront/user_filter.dart';

import 'my_widgets/user_card.dart';

class UsersScreen extends StatefulWidget {
  final int? matchId;

  const UsersScreen.forMatch({
    Key? key,
    required this.matchId,
  }) : super(key: key);

  const UsersScreen.empty({Key? key})
      : matchId = null,
        super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool isLoading = false;
  UserEntityDTO? client;
  UserService? userService; // this service must be authorized with the token
  List<UserEntityDTO>? displayList;

  TextEditingController _searchController = TextEditingController();

  int _pageNumber = 1, _pageSize = 5;
  int totalPages = 1;
  String? _searchSubstring;

  bool _adminView = false;

  UserFilter? userFilter;

  @override
  void initState() {
    super.initState();
    _loadClientData().then((_) {
      _loadScreenData();
    });
  }

  Future<void> _loadClientData() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await TokenService().getToken();

      if (token == null) throw Exception('Error accessing screen.');

      userService = UserService(jwt: token);
      client = await userService?.getUserEntity();

      var roles = TokenService().getRoles(token);

      bool adminView = false;
      for (var r in roles!) {
        if (r == 'ADMIN') {
          adminView = true;
          break;
        }
      }

      setState(() {
        _adminView = adminView;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadScreenData() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserEntityDTOPaginatedResponse? users;
      if (widget.matchId != null) {
        users = UserEntityDTOPaginatedResponse(
            items: [], currentPage: 1, totalPages: 1);
        users.items = await userService
            ?.getApi()
            ?.apiUserByMatchGet(matchId: widget.matchId);
        totalPages = 1;
        _pageSize = 25;
        _pageNumber = 1;
      } else if (userFilter != null) {
        users = await userService?.getApi()?.apiUserUsersPaginatedGet(
            currentPage: _pageNumber,
            pageSize: _pageSize,
            countryId: userFilter?.countryId ?? null,
            cityId: userFilter?.cityId ?? null,
            isBanned: userFilter?.isBanned ?? null,
            name: userFilter?.name ?? null,
            email: userFilter?.email ?? null,
            dayOfBirth: userFilter?.dayOfBirth ?? null,
            monthOfBirth: userFilter?.monthOfBirth ?? null,
            yearOfBirth: userFilter?.yearOfBirth ?? null,
            isAdmin: userFilter?.isAdmin ?? null,
            orderByAgeAsc: userFilter?.orderByAgeAsc ?? null,
            orderByCreationDateAsc: userFilter?.orderByCreationDateAsc ?? null);
      } else if (_searchSubstring != null && _searchSubstring!.isNotEmpty) {
        users = await userService?.getApi()?.apiUserSearchGet(
            currentPage: _pageNumber,
            pageSize: _pageSize,
            str: _searchSubstring!);
      } else {
        users = await userService?.getUsersPaginated(
          currentPage: _pageNumber,
          pageSize: _pageSize,
        );
      }

      setState(() {
        displayList = users?.items ?? [];
        totalPages = users?.totalPages ?? 1;
        _pageNumber = users?.currentPage ?? 1;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : buildScreen();
  }

  Widget buildScreen() {
    return Scaffold(
      appBar: MyCustomAppBar(
          title: 'Users',
          budget: (client?.budgetUnits?.toDouble() ?? 0.0) / 100,
          actions: [
            if (widget.matchId == null)
              ElevatedButton(
                  onPressed: _openPlayersFilterScreen,
                  child: Icon(Icons.filter_list_sharp))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _search,
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            Expanded(
              child: displayList == null || displayList!.isEmpty
                  ? Center(child: Text('No users found'))
                  : ListView.builder(
                      itemCount: displayList!.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          key: UniqueKey(),
                          currentPlayerState: displayList![index],
                          source: userService?.getApi(),
                          actions: [],
                          adminView: _adminView,
                        );
                      },
                    ),
            ),
            buildPaginationControls(),
          ],
        ),
      ),
    );
  }

  Widget buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _pageNumber > 1
              ? () {
                  setState(() {
                    _pageNumber--;
                    _loadScreenData();
                  });
                }
              : null,
        ),
        Text('Page $_pageNumber of $totalPages'),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: _pageNumber < totalPages
              ? () {
                  setState(() {
                    _pageNumber++;
                    _loadScreenData();
                  });
                }
              : null,
        ),
      ],
    );
  }

  Future<void> _search() async {
    setState(() {
      _searchSubstring = _searchController.text;
      _pageNumber = 1; // Reset to first page for new search
    });
    await _loadScreenData();
  }

  void _openPlayersFilterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PlayersFilterScreen(
                onFilterPressed: (filterResult) {
                  setState(() {
                    userFilter = filterResult;
                  });
                  _loadScreenData();
                },
              )),
    );
  }
}
