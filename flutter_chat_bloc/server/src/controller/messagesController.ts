import { prisma } from "../index.ts";
import type { Request, Response } from "express";



export const getMessages = async (req: Request, resp: Response) => {

    try {
        const message = await prisma.messages.findMany({
            where:{
                userId:Number(req.params.id)
            }
        })

        return resp.status(200).json(message);

    } catch (error) {
        return resp.status(500).json({ message: "internal eroro", error: error });
    }
}