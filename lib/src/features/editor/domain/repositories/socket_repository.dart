abstract class SocketRepository {
  void joinRoom(String documentId);

  void typing(Map<String, dynamic> data);

  void autoSave(Map<String, dynamic> data);

  void changeListener(Function(Map<String, dynamic>) func);
}
