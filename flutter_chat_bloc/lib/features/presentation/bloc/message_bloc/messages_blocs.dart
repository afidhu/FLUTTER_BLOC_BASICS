
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/auth_datasource.dart';
import '../../../domain/repositories/message_repository.dart';
import '../auth_blocs/auth_bloc.dart';
import 'message_events.dart';
import 'message_state.dart';

class MessagesBloc extends Bloc<MessageEvents,MessageStates>{
  MessagesBloc(MessageRepository read):super(InitialMessage()){
    on<GetMessageEvent>(_getMessage);
  }

  Future<void> _getMessage(GetMessageEvent event, Emitter<MessageStates> emit) async{
  try{
    emit(InitialMessage());
    final allMessages = await MessageRepository(AuthRemoteDataSource()).getMessagePerUser(1);
    print('allMessages:${allMessages}');
    emit(LoadedMessage(messagesModel: allMessages));
  } catch(e){
    emit(ErrorMessage(message: e.toString()));
  }

  }

}