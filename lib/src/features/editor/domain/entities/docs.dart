// ignore_for_file: public_member_api_docs, sort_constructors_first
class Docs {
  final String id;
  final String title;
  final List<String>? content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  Docs({
    required this.createdBy,
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}

class UpdateDocsTitleReq {
  final String id;
  final String title;
  UpdateDocsTitleReq({
    required this.id,
    required this.title,
  });
}
