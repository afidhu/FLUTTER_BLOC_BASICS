part of 'node_post_bloc.dart';

@immutable
sealed class NodePostEvent {}

class GetNodePostEvent extends NodePostEvent {}
class AddNodePostEvent extends NodePostEvent {
  final String title;
  final String content;
  final int userId;
  final String imagePath;

  AddNodePostEvent({required this.title, required this.content, required this.userId, required this.imagePath});


}