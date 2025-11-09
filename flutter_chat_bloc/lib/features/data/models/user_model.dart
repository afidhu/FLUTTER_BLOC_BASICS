import 'package:flutter_chat_bloc/features/domain/enities/user_entity.dart';

class UserModel extends UserEntity {

  UserModel({
    required id,
    required email,
    required name

}): super(id: id, email: email, name: name);



 factory UserModel.fromJson(Map<String, dynamic> json) {
return UserModel(
  id: json['id'],
  email: json['email'],
  name: json['name']
);

  }


}
