
import 'package:equatable/equatable.dart';

class ReactionEntity extends Equatable{
final  int? likes;
final  int? dislikes;

 const ReactionEntity({this.likes, this.dislikes});

  @override
  // TODO: implement props
  List<Object?> get props => [likes,dislikes];
}