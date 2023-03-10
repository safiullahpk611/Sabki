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
  String?nameOFDropdownresult;
  String?emailId;
  String?homePageHeading;
  String?homePageSubHeading;
  String?bussinessShortDescription;
  String?instagramUrl;
  String?facebookUrl;
  String?twittrerUrl;
  String?youtubeUrl;


  AppUser({
    this.appUserId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.isFirstLogin,
this.nameOFDropdownresult,
this.emailId,
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
    this.homePageHeading,
    this.homePageSubHeading,
    this.bussinessShortDescription,
    this.facebookUrl,
    this.instagramUrl,
    this.twittrerUrl,
    this.youtubeUrl,
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
     this.nameOFDropdownresult = json['nameOFDropdownresult'];
        this.emailId = json['emailId'];
       this.homePageHeading = json['homePageHeading'];
         this.homePageSubHeading = json['homePageSubHeading'];

      this.bussinessShortDescription = json['bussinessShortDescription'];
      this.instagramUrl= json['instagramUrl'];
      this.facebookUrl= json['facebookUrl'];
      this.twittrerUrl= json['twittrerUrl'];
      this.youtubeUrl= json['youtubeUrl'];

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
      'nameOFDropdownresult': this.nameOFDropdownresult,
          'emailId': this.emailId,
                 'homePageHeading': this.homePageHeading,
                   'homePageSubHeading': this.homePageSubHeading,
                   'bussinessShortDescription': this.bussinessShortDescription,
                    'facebookUrl': this.facebookUrl,
                     'twittrerUrl': this.twittrerUrl,
                         'instagramUrl': this.instagramUrl,
                           'youtubeUrl': this.youtubeUrl,

    };
  }
}
