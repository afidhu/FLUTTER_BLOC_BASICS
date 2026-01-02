import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'node_post_event.dart';
part 'node_post_state.dart';

class NodePostBloc extends Bloc<NodePostEvent, NodePostState> {
  NodePostBloc() : super(NodePostInitial()) {
    on<NodePostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
