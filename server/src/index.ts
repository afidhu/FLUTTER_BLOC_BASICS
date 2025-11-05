import express from 'express';
import * as dotenv from 'dotenv';

import postRouter from './router/postRouter.ts'
import { PrismaClient } from '../generated/prisma/client.ts';

dotenv.config(); // Load environment variables from .env

const app = express();
const port = process.env.PORT || 3000;


export const prisma = new PrismaClient()
app.use(express.json())

app.use('/product',postRouter)


app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});