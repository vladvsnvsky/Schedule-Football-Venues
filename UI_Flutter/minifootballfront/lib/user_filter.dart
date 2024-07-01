class UserFilter {
  int? id;
  int? countryId;
  int? cityId;
  bool? isBanned;
  String? name;
  String? email;
  int? dayOfBirth;
  int? monthOfBirth;
  int? yearOfBirth;
  bool? isAdmin;
  bool? orderByAgeAsc;
  bool? orderByCreationDateAsc;

  UserFilter({
    this.id,
    this.countryId,
    this.cityId,
    this.isBanned,
    this.name,
    this.email,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
    this.isAdmin,
    this.orderByAgeAsc,
    this.orderByCreationDateAsc,
  });


  factory UserFilter.fromJson(Map<String, dynamic> json) {
    return UserFilter(
      id: json['id'],
      countryId: json['countryId'],
      cityId: json['cityId'],
      isBanned: json['isBanned'],
      name: json['name'],
      email: json['email'],
      dayOfBirth: json['dayOfBirth'],
      monthOfBirth: json['monthOfBirth'],
      yearOfBirth: json['yearOfBirth'],
      isAdmin: json['isAdmin'],
      orderByAgeAsc: json['orderByAgeAsc'],
      orderByCreationDateAsc: json['orderByCreationDateAsc'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'countryId': countryId,
      'cityId': cityId,
      'isBanned': isBanned,
      'name': name,
      'email': email,
      'dayOfBirth': dayOfBirth,
      'monthOfBirth': monthOfBirth,
      'yearOfBirth': yearOfBirth,
      'isAdmin': isAdmin,
      'orderByAgeAsc': orderByAgeAsc,
      'orderByCreationDateAsc': orderByCreationDateAsc,
    };
  }
}
