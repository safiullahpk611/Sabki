class AppUser {
  String? appUserId;
  String? userEmail;
  String? userPassword;
  bool? isfirstLogin;

  AppUser({
    this.appUserId,
    this.userEmail,
    this.userPassword,
    this.isfirstLogin,
  });

  AppUser.fromJson(json, id) {
    this.appUserId = id;
    this.userEmail = json['userEmail'];
    this.userPassword = json['userPassword'] ?? '';
    this.isfirstLogin = json['isfirstLogin'] ?? '';
  }

  toJson() {
    return {
      'appUserId': this.appUserId,
      'userEmail': this.userEmail,
      'password': this.userPassword,
      'isFirstLogin': this.isfirstLogin,
    };
  }
}
