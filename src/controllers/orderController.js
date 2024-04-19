import responses from "../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);


export const newOrder = async (req, res) => {
    const {user_id, food_id, amount, code, arr_sub_id} = req.body;
    const user = await model.user.findByPk(user_id);
    if(!user){
        return responses({
            res,
            status : 404,
            message : "User not found"
        })
    }
    const food = await model.food.findByPk(food_id);
    if(!food){
        return responses({
            res,
            status : 404,
            message : "Food not found"
        })
    }
    const order = await model.orders.create({
        user_id,
        food_id,
        amount,
        code,
        arr_sub_id
    });
    if(order){
        
        return responses({
            res,
            status : 200,
            message : "Order created successfully",
            data : order
        });
    }
    else{
        return responses({
            res,
            status : 500,
            message : "Order created failed"
        });
    }
}