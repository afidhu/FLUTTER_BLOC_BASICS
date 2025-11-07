import { Router } from "express";
import { AddPost, fetchProduct } from "../controller/postController.ts";


const router = Router()

router.post('/',AddPost)
router.get('/',fetchProduct)



export default router