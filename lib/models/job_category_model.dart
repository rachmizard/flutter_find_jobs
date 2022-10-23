class JobCategoryModel {
  String? id;
  String? imageUrl;
  String? name;
  String? subtitle;
  int? createdAt;
  int? updatedAt;

  JobCategoryModel(
      {this.id,
      this.imageUrl,
      this.name,
      this.subtitle,
      this.createdAt,
      this.updatedAt});

  JobCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    subtitle = json['subtitle'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
