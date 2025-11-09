
import { Router } from "express";
import { getMessages } from "../controller/messagesController.ts";

const router = Router()

router.get('/:id',[getMessages])

export default router