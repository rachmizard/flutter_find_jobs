class UserModel {
  String? id;
  String? email;
  String? name;
  String? password;
  String? goal;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.password,
    this.goal,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    goal = json['goal'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'goal': goal,
    };
  }
}
