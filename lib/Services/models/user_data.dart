// {
//     "UID": "user.user!.uid",
//     "username": "name",
//     "email": "email",
//     "password": "password",
//    "profile":"profile"
// }

class UserData {
  String? uID;
  String? username;
  String? email;
  String? password;
  String? profile;

  UserData({this.uID, this.username, this.email, this.password, this.profile});

  UserData.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =Map<String, dynamic>();
    data['UID'] = uID;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['profile'] = profile;
    return data;
  }
}

