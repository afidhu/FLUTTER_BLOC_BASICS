import type {Request, Response  } from "express";
import { prisma } from "../index.ts";


export const AddToCart = async(req:Request,resp:Response)=>{
 
    try {
        const{productId} = req.body
        const add = await prisma.cart.create({
            data:{
                productId:productId

            }
        })
        return resp.status(201).json(add)
        
    } catch (error) {
        console.log(error)

        return resp.status(404).json(error)
        
    }

}



export const fetchCartdata = async(req:Request,resp:Response)=>{


    try {
        const add = await prisma.cart.findMany({
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


export const cartCount = async(req:Request,resp:Response)=>{


    try {
        const counts = await prisma.cart.count()
        return resp.status(200).json({counts})
        
    } catch (error) {
        console.log(error)

        return resp.status(404).json(error)
        
    }

}