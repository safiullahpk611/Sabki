class AppUser {
String? userEmail;
bool?isfirstLogin;
String? userPassword;
String?appUserId;
String?firstName;
String?lastname;
String?phoneNumber;





AppUser({this.userEmail,this.userPassword,this.isfirstLogin});
  AppUser.fromJson(json, id) {
    this.userEmail = json['userEmail'];
    this.userPassword=json['userPassword'];
    this.isfirstLogin=json['isfirstLogin'];
        this.appUserId=json['appUserId'];
        this.firstName=json['firstName'];
        this.lastname=json['lastName'];
        this.phoneNumber=json['phoneNumber'];
        

}

 toJson() {
    return {
 'userEmail': this.userEmail,
  'userPassword': this.userPassword,
    'isfirstLogin': this.isfirstLogin,
    'appUserId': this.appUserId,
    'phoneNumber':this.phoneNumber,
    'firstName':this.firstName,
    'lastName':this.lastname,


    };

}}