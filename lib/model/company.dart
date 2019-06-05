class Company {
  final String oid;
  final String id;
  final String company;
  final String logo;
  final String info;
  final String hot;

  Company({this.oid, this.id, this.company, this.logo, this.info, this.hot});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      oid: json['_id'],
      id: json['id'],
      company: json['company'],
      logo: json['logo'],
      info: json['info'],
      hot: json['hot'],
    );
  }
}
