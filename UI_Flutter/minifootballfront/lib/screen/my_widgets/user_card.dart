import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/player_signal_r_service.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/uihelper.dart';

class UserCard extends StatefulWidget {
  final UserEntityDTO currentPlayerState;
  final List<Widget>? actions;
  final UserApi? source;
  final bool adminView;

  const UserCard(
      {super.key,
      required this.currentPlayerState,
      this.actions,
      this.source,
      this.adminView = false});

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  MyUiHelper uiHelper = MyUiHelper();
  UserEntityDTO? player;
  UserDetailsDTO? playerDetails;

  bool isUpdating = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isAdmin = false;
  List<String>? roles;
  List<Widget>? cardActions;
  late PlayersSignalRService signalRService;

  int budgetUnits = 0;
  double budgetDollars = 0.0;

  @override
  void initState() {
    super.initState();
    initializePlayerData();
  }

  void initializePlayerData() {
    player = widget.currentPlayerState;
    usernameController.text = player!.username ?? "Not set";
    emailController.text = player!.email ?? "Not set";
    cardActions = widget.actions ?? [];

    initializeSignalR();
    loadDetails();
    checkAdminStatus(player!.token);

    setState(() {
      budgetUnits = player?.budgetUnits ?? 0;
      budgetDollars = budgetUnits / 100.0;
      budgetController.text = budgetDollars.toStringAsFixed(2);
    });
  }

  void initializeSignalR() {
    signalRService = PlayersSignalRService();
    signalRService.startConnection().then((_) {
      signalRService.onPlayerUpdated((updatedPlayer) {
        if (updatedPlayer.id == player?.id) {
          setState(() {
            player = updatedPlayer;
            updateRoleData(updatedPlayer.token);
          });
        }
      });
    });
  }

  void updateRoleData(String? token) {
    if (token == null) return;

    var decodedToken = TokenService().decodeToken(token);
    dynamic roleData = decodedToken?[
            'http://schemas.microsoft.com/ws/2008/06/identity/claims/role'] ??
        "No role";
    List<String> newRoles =
        roleData is String ? [roleData] : List<String>.from(roleData);

    setState(() {
      roles = newRoles;
      isAdmin = roles!.contains("ADMIN");
    });
  }

  void checkAdminStatus(String? token) {
    if (token == null) {
      MyUiHelper.showSnackBar(context, "No token provided", Colors.red);
      return;
    }

    var decodedToken = TokenService().decodeToken(token);
    if (decodedToken == null) {
      MyUiHelper.showSnackBar(context, "Failed to decode token", Colors.red);
      return;
    }

    dynamic roleData = decodedToken[
            'http://schemas.microsoft.com/ws/2008/06/identity/claims/role'] ??
        "No Role";
    List<String> newRoles =
        roleData is String ? [roleData] : List<String>.from(roleData);

    setState(() {
      roles = newRoles;
      isAdmin = roles!.contains("ADMIN");
    });
  }

  Future<void> loadDetails() async {
    try {
      if (widget.adminView) {
        var result = await widget.source?.apiUserByDetailsIdGet(id: player!.id);
        if (result == null) throw Exception("Loading player data failed!");

        if (mounted) {
          setState(() {
            playerDetails = result;
            birthdateController.text =
                playerDetails?.birthdate?.toLocal().toString().split(' ')[0] ??
                    "Not set";
            phoneController.text =
                playerDetails?.phone?.toString() ?? "Not set";
          });
        }
      }
    } catch (e) {
      if (mounted) MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.adminView) isUpdating = !isUpdating;
        });
      },
      child: Card(
        margin: EdgeInsets.all(10),
        color: isUpdating ? Color.fromARGB(255, 206, 251, 245) : null,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPlayerInfo(),
              ButtonBar(
                children: [
                  if (cardActions!.isNotEmpty) ...cardActions!,
                  if (widget.adminView) buildBanningButton(),
                  if (widget.adminView) buildUpdateButton(),
                ],
              ),
              if (isUpdating) buildUpdateForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlayerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          player!.username ?? "Username not specified",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Email: ${player!.email}",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        if (widget.adminView)
          Text(
            "Budget: $budgetDollars",
            style: TextStyle(fontSize: 14),
          ),
      ],
    );
  }

  Widget buildUpdateButton() {
    return uiHelper.createCardButton(
      isUpdating ? "Close" : "Update",
      Colors.blue,
      null,
      null,
      null,
      () {
        setState(() {
          isUpdating = !isUpdating;
        });
      },
    );
  }

  Widget buildAdminButton() {
    return ElevatedButton(
      onPressed: () {
        MyUiHelper.showAlertDialog(
          context,
          "Update entity?",
          "Are you sure you want to continue?",
          () async {
            try {
              if (!isAdmin)
                await widget.source!.apiUserSetAdminPut(id: player!.id);
              else
                await widget.source!.apiUserRemoveAdminPut(id: player!.id);

              MyUiHelper.showSnackBar(
                  context, "Action completed!", Colors.green[600]);
            } catch (e) {
              MyUiHelper.showSnackBar(
                  context, "Something went wrong", Colors.red[600]);
            }
          },
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: isAdmin ? Text("Remove ADMIN") : Text("Assign ADMIN"),
    );
  }

  Widget buildUpdateForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextField(usernameController, 'Username'),
        buildTextField(emailController, 'Email'),
        buildTextField(budgetController, 'Budget'),
        buildDateField(birthdateController, 'Birthdate', selectBirthdate),
        buildTextField(phoneController, 'Phone'),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCompleteButton(),
            SizedBox(width: 10),
            buildAdminButton(),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget buildDateField(TextEditingController controller, String label,
      Function(BuildContext) onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => onTap(context),
          ),
        ),
        readOnly: true,
      ),
    );
  }

  Widget buildCompleteButton() {
    return uiHelper.createCardButton(
      "Complete",
      Colors.green,
      null,
      null,
      16,
      () {
        setState(() {
          isUpdating = false;
        });
        MyUiHelper.showAlertDialog(
          context,
          "Update",
          "Are you sure you want to continue?",
          () async {
            try {
              DateTime? birthdate = DateTime.tryParse(birthdateController.text);
              print(birthdate);
              UpdateUserEntityDTO updateUser = UpdateUserEntityDTO(
                username: usernameController.text,
                userDetails: UpdateUserDetailsDTO(
                    phone: phoneController.text,
                    birthDay: birthdate!.day,
                    birthMonth: birthdate.month,
                    birthYear: birthdate.year),
              );
              await widget.source?.apiUserUpdateUserPut(
                  id: player!.id!, updateUserEntityDTO: updateUser);
              MyUiHelper.showSnackBar(
                  context, "Action completed", Colors.green[600]);
            } catch (e) {
              MyUiHelper.showSnackBar(
                  context, "Something went wrong", Colors.red[600]);
            }
          },
        );
      },
    );
  }

  DateTime? parseLocalDateToUtc(String dateString) {
    try {
      // Define the date format
      // Parse the date string to a DateTime object
      final localDateTime = DateTime.parse(dateString);
      // Convert local DateTime to UTC
      final utcDateTime = localDateTime.toUtc();
      return utcDateTime;
    } catch (e) {
      return null; // Handle parsing error if necessary
    }
  }

  Widget buildBanningButton() {
    return ElevatedButton(
        onPressed: () async {
          try {
            bool _clientConfirms = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Change player state?'),
                    content: Text(
                        "Are you sure you want to ${player!.isBanned! ? "unban" : "ban"} this player?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Proceed')),
                    ],
                  );
                });
            if (_clientConfirms) {
              if (player!.isBanned!) {
                await widget.source?.apiUserUnbanPlayerPut(id: player!.id!);
                MyUiHelper.showSnackBar(context,
                    "Player unbanned successfully!", Colors.green[600]);
              } else {
                await widget.source?.apiUserBanPlayerPut(id: player!.id!);
                MyUiHelper.showSnackBar(
                    context, "Player banned successfully!", Colors.green[600]);
              }
              setState(() {
                player!.isBanned = !player!.isBanned!;
              });
            }
          } catch (e) {}
        },
        child: Text(player!.isBanned! ? "Unban player" : "Ban player"));
  }

  Future<void> selectBirthdate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 100, now.month, now.day);
    DateTime lastDate = DateTime(now.year - 16, now.month, now.day);

    DateTime initialDate = lastDate.isBefore(now) ? lastDate : now;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        birthdateController.text =
            pickedDate.toLocal().toIso8601String().split('T').first;
      });
    }
  }
}
