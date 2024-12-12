class MetadataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  MetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory MetadataModel.fromJson(dynamic json) {
    return MetadataModel(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
}
