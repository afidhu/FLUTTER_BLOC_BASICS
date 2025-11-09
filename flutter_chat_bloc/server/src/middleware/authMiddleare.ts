import type { NextFunction, Request, Response } from "express";
import { prisma } from "../index.ts";

import dotenv from 'dotenv';
import pkg from 'jsonwebtoken';
const { verify } = pkg;
dotenv.config();

export const verifyUserMiddleware = async (req: Request, resp: Response, next: NextFunction) => {
   const tokenGot = req.headers.authorization;
    try {
    
        if (tokenGot ) {
        const token:any =tokenGot.split(' ')[1];

            const {payload} = verify(token, `${process.env.WEB_SECRET}`) as any
            if (payload) {
                req.body =payload;
                next();
            }
            else {

                return resp.status(403).json('Unauthoried');
            }
        }
        else {
            return resp.status(404).json('Token Required');
        }

    } catch (error:any) {
        return resp.status(500).json({ message: "internal eroro", error: error.message });
    }
}


