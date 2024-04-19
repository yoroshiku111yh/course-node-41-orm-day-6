import express from 'express';
import { newOrder } from '../controllers/orderController.js';


const orderRouter = express();

orderRouter.post("/", newOrder);



export default orderRouter;