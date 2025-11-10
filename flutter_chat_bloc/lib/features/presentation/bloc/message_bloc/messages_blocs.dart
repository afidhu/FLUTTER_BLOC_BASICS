
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';

import '../../../data/datasource/auth_datasource.dart';
import '../../../domain/repositories/message_repository.dart';
import '../auth_blocs/auth_bloc.dart';
import 'message_events.dart';
import 'message_state.dart';

class MessagesBloc extends Bloc<MessageEvents,MessageStates>{
  MessagesBloc(MessageRepository messageRepository):super(InitialMessage()){
    on<GetMessageEvent>(_getMessage);
  }

  Future<void> _getMessage(GetMessageEvent event, Emitter<MessageStates> emit) async{
  try{
    emit(InitialMessage());
    final allMessages = await MessageRepository(AuthRemoteDataSource()).getMessagePerUser(AppService().getXStorage.read('userId'));
    print('allMessages:${allMessages}');
    emit(LoadedMessage(messagesModel: allMessages));
  } catch(e){
    emit(ErrorMessage(message: e.toString()));
  }

  }

}