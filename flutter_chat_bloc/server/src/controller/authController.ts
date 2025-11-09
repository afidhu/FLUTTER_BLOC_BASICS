import type {Request, Response } from "express";
import { prisma } from "../index.ts";
import bcrypt from "bcrypt";

import pkg from 'jsonwebtoken';
const { sign } = pkg;
import dotenv from 'dotenv';
// import { sign } from "jsonwebtoken";



export const signUp = async(req:Request, resp:Response)=>{

    const{email,name , password,} = req.body;
    try {
        const addUser = await prisma.user.create({
            data:{
                email:email,
                name:name,
                password:bcrypt.hashSync(password,10)
            }
        })

        return resp.status(201).json(addUser);
        
    } catch (error) {
          return resp.status(500).json({message:"internal eroro",error:error});
    }
}



export const login = async(req:Request, resp:Response)=>{

    const{email, password} = req.body;
    if(!email || !password) return resp.send('all field require')
    try {
        const user = await prisma.user.findUnique({
            where:{
                 email:email,
            }
        })

        if(user){
            const payload =user.id;
        const token= sign({
            payload,

        }, `${process.env.WEB_SECRET}`,{ expiresIn: '1h' } );

     return resp.status(200).json({user:user, token:token});
        }
        else{

     return resp.status(404).json('wrong credential');
        }
        
    } catch (error) {
          return resp.status(500).json({message:"internal eroro",error:error});
    }
}


