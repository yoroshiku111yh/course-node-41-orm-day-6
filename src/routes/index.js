

import express from "express";
import restaurantRouter from "./restaurant.js";
import userRouter from "./user.js";
import orderRouter from "./order.js";

const rootRoutes = express();

rootRoutes.use("/restaurant", restaurantRouter);
rootRoutes.use("/user", userRouter);
rootRoutes.use("/order", orderRouter);

export default rootRoutes;
