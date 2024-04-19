import express from 'express';
import { getAllRestaurant, getLikeUsers, getRateUsers, getRestaurantById, rateRestaurant, toggleLike } from '../controllers/restaurantController.js';


const restaurantRouter = express();

restaurantRouter.get("/", getAllRestaurant);
restaurantRouter.get("/:id", getRestaurantById);
restaurantRouter.get("/:id/likes", getLikeUsers);
restaurantRouter.get("/:id/rates", getRateUsers);

restaurantRouter.post("/like", toggleLike);
restaurantRouter.post("/rate", rateRestaurant);


export default restaurantRouter;