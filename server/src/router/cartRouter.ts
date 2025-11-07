
import { Router } from "express";
import { AddToCart, cartCount, fetchCartdata } from "../controller/cartController.ts";


const router = Router()

router.post('/',AddToCart)
router.get('/',fetchCartdata)
router.get('/count',cartCount)





export default router