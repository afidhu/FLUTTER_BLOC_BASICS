import { Server, Socket } from "socket.io";
import { createMessages } from "../controller/messagesController.ts";


let connectedUser: String[] = []

export const registerChatHandlers =(io:Server, socket:Socket)=>{
connectedUser.push(socket.id,)
io.emit('users', connectedUser)
     console.log("User connected:", socket.id);
   socket.emit('me', socket.id)


   socket.on('join_room', (data)=>{
    console.log('rooom', data)
        socket.join(data.room);
     })




     socket.on('send_messages', async(data)=>{
        const sendMessage =await createMessages(data)
        console.log(sendMessage)
          io.to(data.receiverId).emit('get_messages',(sendMessage))
     })

    
    
    
    
    
    
     socket.on("disconnect", () => {
  connectedUser = connectedUser.filter((id: String) => id !== socket.id);
    console.log("User disconnected:", socket.id);
  });
}