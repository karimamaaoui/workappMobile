class User {


 String firstName ;
  String lastName;
  int phone;
  String gender;

  String hightDegres;
  int issuedBy;
  int yearOfPassing;
  String jobType;

  String skill;
 String jobApplyFor;
 String workExperience;
 int  expectedSalary;

 User( {

     this.firstName,
     this.lastName,
     this.phone,
     this.gender,

     this.hightDegres,
     this.issuedBy,
     this.yearOfPassing,
     this.jobType,

     this.skill,
     this.jobApplyFor,
     this.workExperience,
     this.expectedSalary,
 });

 factory User.fromJson(Map<String, dynamic> json) {
  return User(
   firstName: json['firstName'],
   lastName: json['lastName'],
   phone: json['phone'],
   gender: json['gender'],

   hightDegres: json['hightDegres'],
   issuedBy: json['issuedBy'],
   yearOfPassing: json['yearOfPassing'],
   jobType: json['jobType'],


   skill: json['skill'],
   jobApplyFor: json['jobApplyFor'],
   workExperience: json['workExperience'],
   expectedSalary: json['expectedSalary'],

  );
 }
}


class OneUser {

 int id;
 String username;
 String email;

 OneUser({this.id,this.username,this.email});
 factory OneUser.fromJson(Map<String, dynamic> json) {
  return OneUser(
   id: json['id'],
   username: json['username'],
   email: json['email'],

  );
 }
}


