import { prisma } from "../index.ts";
import type { Request, Response } from "express";



export const getMessages = async (req: Request, resp: Response) => {

    try {
        const message = await prisma.messages.findMany({
            where:{
                senderId:Number(req.params.id)
            }
        })

        return resp.status(200).json(message);

    } catch (error) {
        return resp.status(500).json({ message: "internal eroro", error: error });
    }
}




export const createMessages = async (datas:any) => {

    try {
        const message = await prisma.messages.create({
            data:{
                content:datas.content,
                senderId:Number(datas.senderId),
                receiverId:Number(datas.receiverId),
            }
        })

        return [message]


    } catch (error) {
        console.log('error aer :', error)
    }
}