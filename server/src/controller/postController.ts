import type {Request, Response  } from "express";
import { prisma } from "../index.ts";


export const AddPost = async(req:Request,resp:Response)=>{


    try {
        const add = await prisma.product.create({
            data:{
                title:req.body.title,
                description:req.body.description,
                price:req.body.price
            }
        })
        return resp.status(201).json(add)
        
    } catch (error) {
        console.log(error)

        return resp.status(404).json(error)
        
    }

}




export const fetchProduct = async(req:Request,resp:Response)=>{


    try {
        const add = await prisma.product.findMany({
            orderBy:{
                 createdAt:'desc'
            }
        })
        return resp.status(200).json(add)
        
    } catch (error) {
        console.log(error)

        return resp.status(404).json(error)
        
    }

}