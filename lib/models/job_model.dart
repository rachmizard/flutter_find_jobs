class JobModel {
  final String? id;
  final String? title;
  final String? description;
  final String? location;
  final String? salary;
  final String? company;
  final String? companyLogo;
  final String? companyUrl;
  final String? type;
  final String? url;
  final String? createdAt;

  JobModel({
    this.id,
    this.title,
    this.description,
    this.location,
    this.salary,
    this.company,
    this.companyLogo,
    this.companyUrl,
    this.type,
    this.url,
    this.createdAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      salary: json['salary'],
      company: json['company'],
      companyLogo: json['company_logo'],
      companyUrl: json['company_url'],
      type: json['type'],
      url: json['url'],
      createdAt: json['created_at'],
    );
  }

  toJSON() {
    return JobModel(
      id: id,
      title: title,
      description: description,
      location: location,
      salary: salary,
      company: company,
      companyLogo: companyLogo,
      companyUrl: companyUrl,
      type: type,
      url: url,
      createdAt: createdAt,
    );
  }
}
