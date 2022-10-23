class JobCategoryModel {
  late String id;
  late String imageUrl;
  late String name;
  late int createdAt;
  late int updatedAt;

  JobCategoryModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  JobCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
