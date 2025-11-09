// src/index.ts
import dotenv from 'dotenv';
dotenv.config(); // Load environment variables from .env

import express from 'express';
import { PrismaClient } from '../generated/prisma/client.ts';
import authRoute from './routes/authRoute.ts'
import messageRoute from './routes/messageRoute.ts'

const app = express();
const port = process.env.PORT || 3000;


export const prisma = new PrismaClient()


app.use(express.json())
app.use('/auth', authRoute)
app.use('/message', messageRoute)




app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});