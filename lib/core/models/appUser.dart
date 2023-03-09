class AppUser {
  String? appUserId;
  String? userName;
  String? userEmail;
  String? userPassword;
  bool? isFirstLogin;

  AppUser({
    this.appUserId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.isFirstLogin,
  });

  AppUser.fromJson(json, id) {
    this.appUserId = id;
    this.userName = json['userName'];
    this.userEmail = json['userEmail'];
    this.userPassword = json['userPassword'] ?? '';
    this.isFirstLogin = json['isFirstLogin'] ?? '';
  }

  toJson() {
    return {
      'appUserId': this.appUserId,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'password': this.userPassword,
      'isFirstLogin': this.isFirstLogin,
    };
  }
}
