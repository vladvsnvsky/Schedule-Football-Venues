import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SignalRService {
  late final HubConnection _hubConnection;

  SignalRService() {
    _hubConnection = HubConnectionBuilder()
        .withUrl("https://licenta.mediainfoschool.com/gamehub")
        .build();
  }

  Future<void> startConnection() async {
    try {
      await _hubConnection.start();
      print("Connection started");
    } catch (e) {
      print("Error while starting connection: $e");
    }
  }

  void onPlayerCountUpdated(Function(int gameId, int newPlayerCount) callback) {
    _hubConnection.on('PlayerCountUpdated', (arguments) {
      if (arguments != null && arguments.length >= 2) {
        final gameId = arguments[0] as int;
        final newPlayerCount = arguments[1] as int;
        callback(gameId, newPlayerCount);
      } else {
        print("Invalid arguments received for PlayerCountUpdated");
      }
    });
  }

  void onPlayerUpdated(Function(UserEntityDTO user) callback) {
    _hubConnection.on('PlayerUpdated', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        try {
          final userDTO = UserEntityDTO.fromJson(arguments[0]);
          callback(userDTO!);
        } catch (e) {
          print("Error processing PlayerUpdated arguments: $e");
        }
      } else {
        print("Invalid arguments received for PlayerUpdated");
      }
    });
  }

  Future<void> stopConnection() async {
    try {
      await _hubConnection.stop();
      print("Connection stopped");
    } catch (e) {
      print("Error while stopping connection: $e");
    }
  }
}
