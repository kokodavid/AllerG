class Users {
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? emailAddress;
  String? phoneNumber;
  String? sosPhoneNumber;
  String? sosContact;
  String? gender;
  String? dob;
  String? age;
  String? allergyType;
  String? picture;
  String? hasEpipen;
  String? ipAddress;
  String? location;
  String? createdOn;
  String? updatedOn;

  Users(
      {
        this.firstName,
        this.lastName,
        this.username,
        this.password,
        this.emailAddress,
        this.phoneNumber,
        this.sosPhoneNumber,
        this.sosContact,
        this.gender,
        this.dob,
        this.age,
        this.allergyType,
        this.picture,
        this.hasEpipen,
        this.ipAddress,
        this.location,
        this.createdOn,
        this.updatedOn});

  Users.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    sosPhoneNumber = json['sosPhoneNumber'];
    sosContact = json['sosContact'];
    gender = json['gender'];
    dob = json['dob'];
    age = json['age'];
    allergyType = json['allergyType'];
    picture = json['picture'];
    hasEpipen = json['hasEpipen'];
    ipAddress = json['ipAddress'];
    location = json['location'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['username'] = username;
    data['password'] = password;
    data['emailAddress'] = emailAddress;
    data['phoneNumber'] = phoneNumber;
    data['sosPhoneNumber'] = sosPhoneNumber;
    data['sosContact'] = sosContact;
    data['gender'] = gender;
    data['dob'] = dob;
    data['age'] = age;
    data['allergyType'] = allergyType;
    data['picture'] = picture;
    data['hasEpipen'] = hasEpipen;
    data['ipAddress'] = ipAddress;
    data['location'] = location;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}
