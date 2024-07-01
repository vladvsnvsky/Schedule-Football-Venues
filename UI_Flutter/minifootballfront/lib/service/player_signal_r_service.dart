import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:signalr_netcore/signalr_client.dart';

class PlayersSignalRService {
  final HubConnection _hubConnection;

  PlayersSignalRService()
      : _hubConnection = HubConnectionBuilder()
            .withUrl("https://licenta.mediainfoschool.com/playerhub")
            .build();

  Future<void> startConnection() async {
    try {
      await _hubConnection.start();
    } catch (e) {
      print(e.toString());
    }
  }

  void onPlayerUpdated(Function(UserEntityDTO entity) callback) {
    _hubConnection.on('PlayerUpdated', (arguments) {
      try {
        final entity = UserEntityDTO.fromJson(arguments![0]);
        if (entity == null) throw Exception("Entity null!");
        callback(entity);
      } catch (e) {
        throw e;
      }
    });
  }

  Future<void> stopConnection() async {
    await _hubConnection.stop();
  }
}
