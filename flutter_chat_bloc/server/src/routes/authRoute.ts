import { Router } from "express";
import {getAllUsers, login, signUp, verifyUser } from "../controller/authController.ts";
import {  verifyUserMiddleware } from "../middleware/authMiddleare.ts";


const router = Router()

router.post('/register',signUp)
router.post('/login',login)
router.get('/users',getAllUsers)
router.get('/verify',[verifyUserMiddleware,verifyUser])


export default router