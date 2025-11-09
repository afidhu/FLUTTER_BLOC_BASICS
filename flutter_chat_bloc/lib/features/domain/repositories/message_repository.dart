


import '../../data/datasource/auth_datasource.dart';
import '../../data/models/messages_model.dart';

class MessageRepository{
   final  AuthRemoteDataSource authRemoteDataSource;
   MessageRepository(this.authRemoteDataSource);

  Future<List<MessagesModel>> getMessagePerUser(int id) async{
  try{
    final response = await authRemoteDataSource.userMessage(id);
  if(response.statusCode == 200) {
    print('response : $response');
    List<dynamic> jsonList = response.data;
    List<MessagesModel> messageList = jsonList.map((json) =>
        MessagesModel.fromJson(json)).toList();
    print('messageList : $messageList');
    return messageList;
  }
  else{
    throw Exception("Error");
  }
  }catch(e){
    print(e);
  throw Exception("Error at: $e");
  }

  }
}