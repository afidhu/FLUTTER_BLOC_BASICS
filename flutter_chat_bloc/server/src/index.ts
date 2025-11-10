// src/index.ts
import dotenv from 'dotenv';
dotenv.config(); // Load environment variables from .env

import express from 'express';
import { PrismaClient } from '../generated/prisma/client.ts';
import authRoute from './routes/authRoute.ts'
import messageRoute from './routes/messageRoute.ts'

import { createServer } from 'http';
    import { Server } from 'socket.io';
import { registerChatHandlers } from './socketIo/sockets_logics.ts';

const port = process.env.PORT || 3000;


const app = express();

const httpServer = createServer(app);

export const prisma = new PrismaClient()

    const io = new Server(httpServer, {
        cors: {
            origin: '*', // Adjust for specific client origins in production
            methods: ['GET', 'POST']
        }
    });

app.use(express.json())
app.use('/auth', authRoute)
app.use('/message', messageRoute)

io.on("connection", (socket) => {
  registerChatHandlers(io, socket);
});



httpServer.listen(port, () => {
    console.log(`Server running on port ${port}`);
});