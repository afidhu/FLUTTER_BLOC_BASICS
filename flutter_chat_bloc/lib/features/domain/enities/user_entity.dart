
class UserEntity{
  final int? id;
  final String? email;
  final String ?name;
  final String? password;
  final String? token;


  UserEntity({
    required this.id,
    required this.email,
    required this.name,
     this.password,
     this.token,

  });

}