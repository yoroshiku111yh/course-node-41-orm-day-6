import responses from "../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

export const getAllRestaurant = async (req, res) => {
  const listRestaurant = await model.restaurant.findAll();
  if (listRestaurant.length > 0) {
    return responses({
      res,
      data: listRestaurant,
      status: 200,
      message: "List all restaurant",
    });
  } else {
    return responses({
      res,
      data: [],
      status: 404,
      message: "Not found",
    });
  }
};

export const getRestaurantById = async (req, res) => {
  const { id } = req.params;
  const restaurant = await model.restaurant.findByPk(id);
  if (restaurant) {
    return responses({
      res,
      data: restaurant,
      status: 200,
      message: "Get restaurant by id",
    });
  } else {
    return responses({
      res,
      data: null,
      status: 404,
      message: "Restaurant not found",
    });
  }
};

export const getLikeUsers = async (req, res) => {
  const { id } = req.params;
  const users = await model.like_res.findAll({
    where: {
      res_id: id,
    },
    include: [
      {
        model: model.user,
        as: "user",
        attributes: { exclude: ["password"] },
      },
    ],
  });
  if (users.length > 0) {
    return responses({
      res,
      data: users,
      status: 200,
      message: "List data users like this restaurant",
    });
  } else {
    return responses({
      res,
      data: [],
      status: 404,
      message: "Not found",
    });
  }
};

export const getRateUsers = async (req, res) => {
  const { id } = req.params;
  const users = await model.rate_res.findAll({
    where: {
      res_id: id,
    },
    include: [
      {
        model: model.user,
        as: "user",
        attributes: { exclude: ["password"] },
      },
    ],
  });
  if (users.length > 0) {
    return responses({
      res,
      data: users,
      status: 200,
      message: "List data users rate this restaurant",
    });
  } else {
    return responses({
      res,
      data: [],
      status: 404,
      message: "Not found",
    });
  }
};

export const toggleLike = async (req, res) => {
  const { res_id, user_id } = req.body;
  const restaurant = await model.restaurant.findByPk(res_id);
  if (!restaurant) {
    return responses({
      res,
      status: 404,
      message: "Restaurant not found",
    });
  }
  const user = await model.user.findByPk(user_id);
  if (!user) {
    return responses({
      res,
      status: 404,
      message: "User not found",
    });
  }
  const like = await model.like_res.findOne({
    where: {
      res_id,
      user_id,
    },
  });
  if (like) {
    await model.like_res.destroy({
      where: {
        res_id,
        user_id,
      },
    });
    return responses({
      res,
      status: 200,
      message: "Success unlike restaurant",
    });
  } else {
    await model.like_res.create({
      res_id,
      user_id,
      date_like: new Date(),
    });
    return responses({
      res,
      status: 200,
      message: "Success like restaurant",
    });
  }
};

export const rateRestaurant = async (req, res) => {
  const { res_id, user_id } = req.body;
  const restaurant = await model.restaurant.findByPk(res_id);
  if (!restaurant) {
    return responses({
      res,
      status: 404,
      message: "Restaurant not found",
    });
  }
  const user = await model.user.findByPk(user_id);
  if (!user) {
    return responses({
      res,
      status: 404,
      message: "User not found",
    });
  }
  const rate = await model.rate_res.findOne({
    where: {
      res_id,
      user_id,
    },
  });
  if (rate) {
    await model.rate_res.update(
      {
        amount: rate.amount + 1,
      },
      {
        where: {
          res_id,
          user_id,
        },
      }
    );
    return responses({
      res,
      data: {
        amount: rate.amount + 1,
      },
      status: 200,
      message: "Success update amount rate restaurant",
    });
  } else {
    await model.rate_res.create({
      res_id,
      user_id,
      date_rate: new Date(),
      amount: 1,
    });
    return responses({
      res,
      status: 200,
      data: {
        amount: 1,
      },
      message: "Success create new rate restaurant",
    });
  }
};
