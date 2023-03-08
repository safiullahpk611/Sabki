class AppUser {
  String? appUserId;
  String? userEmail;
  String? password;
  bool? isFirstLogin;

  AppUser({
    this.appUserId,
    this.userEmail,
    this.password,
    this.isFirstLogin,
  });

  AppUser.fromJson(json, id) {
    this.appUserId = id;
    this.userEmail = json['userEmail'];
    this.password = json['password'] ?? '';
    this.isFirstLogin = json['isFirstLogin'] ?? '';
  }

  toJson() {
    return {
      'appUserId': this.appUserId,
      'userEmail': this.userEmail,
      'password': this.password,
      'isFirstLogin': this.isFirstLogin,
    };
  }
}
