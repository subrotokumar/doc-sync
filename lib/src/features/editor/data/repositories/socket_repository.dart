import 'package:docsync/src/features/editor/domain/repositories/socket_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketRepositoryImpl extends SocketRepository {
  final io.Socket _socketClient;
  SocketRepositoryImpl(this._socketClient);

  @override
  void joinRoom(String documentId) {
    _socketClient.emit('join', documentId);
  }
}
