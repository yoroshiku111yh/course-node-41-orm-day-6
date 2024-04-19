import express from "express";
import cors from "cors";
import rootRoutes from "./routes/index.js";
const app = express();

////Middleware
app.use(express.json());
app.use(
  cors({
    origin: [],
  })
);

app.use(rootRoutes);

app.listen(8080);


//sequelize-auto -h 127.0.0.1 -d db_food -u root -x 123456 -p 3306  --dialect mysql -o ./src/models