import responses from "../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

export const getAllUser = async (req, res) => {
    const users = await model.user.findAll({
        attributes : {exclude : ["password"]}
    });
    if(users.length > 0){
        return responses({
            res,
            data : users,
            status : 200,
            message : "List all users"
        })
    }
    else {
        return responses({
            res, 
            data : [],
            status : 404,
            message : "Not found"
        })
    }
}

export const getUserById = async (req, res) => {
    const {id} = req.params;
    const user = await model.user.findByPk(id, {
        attributes : {exclude : ["password"]}
    });
    if(res){
        return responses({
            res,
            data : user,
            status : 200,
            message : "Get user by id"
        })
    }
    else{
        return responses({
            res,
            data : null,
            status : 404,
            message : "user not found"
        })
    }
}

export const getLikeRestaurant = async (req, res) => {
    const { id } = req.params;
    const listRes = await model.like_res.findAll({
        where: {
            user_id: id
        },
        include : ["re"]
    });
    if(listRes.length > 0){
        return responses({
            res,
            data : listRes,
            status : 200,
            message : "List all restaurant user liked"
        })
    }
    else{
        return responses({
            res,
            data : [],
            status : 404,
            message : "Not found"
        })
    }
}

export const getRateRestaurant = async (req, res) => {
    const { id } = req.params;
    const listRes = await model.rate_res.findAll({
        where: {
            user_id: id
        },
        include : ["re"]
    });
    if(listRes.length > 0){
        return responses({
            res,
            data : listRes,
            status : 200,
            message : "List all restaurant user rated"
        })
    }
    else{
        return responses({
            res,
            data : [],
            status : 404,
            message : "Not found"
        })
    }
}