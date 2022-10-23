class JobCategoryModel {
  String? id;
  String? imageUrl;
  String? name;
  int? createdAt;
  int? updatedAt;

  JobCategoryModel(
      {this.id, this.imageUrl, this.name, this.createdAt, this.updatedAt});

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
