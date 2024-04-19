import mysql2 from "mysql2";
import { Sequelize } from "sequelize";
import { connectConfig } from "../config/database.js";


const connect = {
  database: connectConfig.db_name ,
  username: connectConfig.db_username,
  passwd: connectConfig.db_password,
  config: {
    host: connectConfig.db_host,
    port: connectConfig.db_port,
    dialect: connectConfig.db_dialect, // need install package module database mysql2
  },
};

const sequelize = new Sequelize(
  connect.database,
  connect.username,
  connect.passwd,
  connect.config
);

export default sequelize;

// yarn sequelize-auto -h 127.0.0.1 -d db_food -u root -p 3306 -x 123456 -e mysql -o src/models -l esm