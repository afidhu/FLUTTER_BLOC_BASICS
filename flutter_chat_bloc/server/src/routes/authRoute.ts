import { Router } from "express";
import {login, signUp, verifyUser } from "../controller/authController.ts";
import {  verifyUserMiddleware } from "../middleware/authMiddleare.ts";


const router = Router()

router.post('/register',signUp)
router.post('/login',login)
router.get('/verify',[verifyUserMiddleware,verifyUser])


export default router