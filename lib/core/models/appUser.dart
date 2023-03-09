class AppUser {
  String? appUserId;
  String? userName;
  String? userEmail;
  String? userPassword;
  bool? isFirstLogin;

  String? businessName;
  String? websiteUrl;
  String? logoImage;
  String? favIcon;
  String? contactPerson;
  String? phoneNo;
  String? secPhoneNo;
  String? userSecEmail;
  String? address;
  String? mapLocation;

  AppUser({
    this.appUserId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.isFirstLogin,

    this.businessName,
    this.websiteUrl,
    this.logoImage,
    this.favIcon,
    this.contactPerson,
    this.phoneNo,
    this.secPhoneNo,
    this.userSecEmail,
    this.address,
    this.mapLocation,
  });

  AppUser.fromJson(json, id) {
    this.appUserId = id;
    this.userName = json['userName'];
    this.userEmail = json['userEmail'];
    this.userPassword = json['userPassword'] ?? '';
    this.isFirstLogin = json['isFirstLogin'] ?? '';

    this.businessName = json['businessName'];
    this.websiteUrl = json['websiteUrl'];
    this.logoImage = json['logoImage'];
    this.favIcon = json['favIcon'];
    this.contactPerson = json['contactPerson'];
    this.phoneNo = json['phoneNo'];
    this.secPhoneNo = json['secPhoneNo'];
    this.userSecEmail = json['userSecEmail'];
    this.address = json['address'];
    this.mapLocation = json['mapLocation'];

  }

  toJson() {
    return {
      'appUserId': this.appUserId,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'password': this.userPassword,
      'isFirstLogin': this.isFirstLogin,

      'businessName': this.businessName,
      'websiteUrl': this.websiteUrl,
      'logoImage': this.logoImage,
      'favIcon': this.favIcon,
      'contactPerson': this.contactPerson,
      'phoneNo': this.phoneNo,
      'secPhoneNo': this.secPhoneNo,
      'userSecEmail': this.userSecEmail,
      'address': this.address,
      'mapLocation': this.mapLocation,
    };
  }
}
