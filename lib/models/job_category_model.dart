class JobCategoryModel {
  final String id;
  final String imageUrl;
  final String name;
  final String subtitle;
  final int createdAt;
  final int updatedAt;

  JobCategoryModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.subtitle,
      required this.createdAt,
      required this.updatedAt});

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) {
    return JobCategoryModel(
        id: json['id'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        subtitle: json['subtitle'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'subtitle': subtitle,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
