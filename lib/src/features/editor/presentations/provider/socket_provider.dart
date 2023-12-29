import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:docsync/src/features/editor/data/repositories/socket_repository.dart';
import 'package:docsync/src/features/editor/domain/repositories/socket_repository.dart';

part 'generated/socket_provider.g.dart';

@Riverpod(keepAlive: true)
io.Socket socketClient(SocketClientRef ref) {
  final socket = io.io(
    "http://localhost:3001",
    io.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build(),
  );

  socket.connect();
  return socket;
}

@Riverpod(keepAlive: true)
SocketRepository socketRepository(SocketRepositoryRef ref) {
  final socket = ref.watch(socketClientProvider);
  return SocketRepositoryImpl(socket);
}
