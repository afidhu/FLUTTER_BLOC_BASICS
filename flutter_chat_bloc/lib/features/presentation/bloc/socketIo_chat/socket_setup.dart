import 'package:socket_io_client/socket_io_client.dart' as IO;


void myConnection(){
  IO.Socket? socket;


  socket  = IO.io('http://192.168.1.133:5000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  socket.connect();
  socket.onConnect((_){
    print('ok fine connected');
    socket!.on('me', (data){

      print('usersId : $data');
    });
    socket.on('users', (data){
      print('users are: $data');
    });
  });

}