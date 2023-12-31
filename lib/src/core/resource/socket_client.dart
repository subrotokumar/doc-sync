import 'package:docsync/src/core/constants/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = io(
      endpoint,
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );
    socket?.connect();
  }

  static SocketClient get instance {
    _instance ?? SocketClient._internal();
    return _instance!;
  }
}
