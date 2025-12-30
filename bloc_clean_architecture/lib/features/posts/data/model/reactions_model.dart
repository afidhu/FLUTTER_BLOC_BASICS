


import '../../domain/entities/reaction_entity.dart';

class ReactionsModel  extends ReactionEntity{
const ReactionsModel({super.likes, super.dislikes});

 factory ReactionsModel.fromJson(dynamic json) {
   return ReactionsModel(
     likes: json['likes'],
     dislikes: json['dislikes'],
   );
  }

    //)
    // likes = json['likes'];
    // dislikes = json['dislikes'];
  }
  // int? likes;
  // int? dislikes;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['likes'] = likes;
  //   map['dislikes'] = dislikes;
  //   return map;
  // }