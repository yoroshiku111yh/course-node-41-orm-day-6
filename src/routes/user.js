import express from 'express';
import { getAllUser, getLikeRestaurant, getRateRestaurant, getUserById } from '../controllers/userController.js';


const userRouter = express();

userRouter.get("/", getAllUser);
userRouter.get("/:id", getUserById);
userRouter.get("/:id/likes", getLikeRestaurant);
userRouter.get("/:id/rates", getRateRestaurant);



export default userRouter;