class Document {
  final String id;
  final String title;
  final List<String>? content;
  final DateTime createdAt;
  final DateTime updatedAt;
  Document({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}

class MyDocuments {
  final List<Document> docs;
  MyDocuments({required this.docs});
}
