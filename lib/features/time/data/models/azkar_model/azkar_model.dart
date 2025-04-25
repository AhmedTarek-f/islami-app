class AzkarModel {
  const AzkarModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });
  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  static AzkarModel empty() => const AzkarModel(
        category: "",
        count: "",
        description: "",
        reference: "",
        content: "",
      );

  factory AzkarModel.fromJson(Map<String, dynamic> data) {
    if (data.isNotEmpty) {
      return AzkarModel(
          category: data["category"] as String,
          count: data["count"] as String,
          description: data["description"] as String,
          reference: data["reference"] as String,
          content: data["content"] as String);
    } else {
      return empty();
    }
  }
}
