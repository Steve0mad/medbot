class User{
  String? id;
  String? fullName;
  int? age;
  String? email;
  User({this.id,this.email,this.age,this.fullName});
 User.fromFiresotre(Map<String,dynamic>?data){
id = data?['id'];
fullName= data?['fullname'];
age = data?['age'];
email= data?['email'];


 }
 Map<String,dynamic> toFiresotre(){
return{
  "id":id,
  "fullname":fullName,
  "age":age,
  "email":email

};


 }
}