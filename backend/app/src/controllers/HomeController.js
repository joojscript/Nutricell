import User from '../models/Users';

import TimeController from '../controllers/TimeController';

import authConfig from '../config/auth';

import jwt from 'jsonwebtoken';
import promisify from 'util';
import FoodController from './FoodController';

class HomeController {
  async index(req, res) {

    const decoded = await jwt.decode(req.userId);

    const user = await User.findById({ _id: decoded.id });

    const imc = (user['weight'] / user['height']) * user.age;

    let now = new Date();

    const points = TimeController.getTimeTable(now.getHours());

    const result = (points / imc) * 10;

    const veredicts = await FoodController.getAndCompare(result, user.isDiabetic, user.isLactoseIntolerant, user.isHypertensive);

    return res.json({ user, imc, now, points, result, veredicts });

  }

}

export default new HomeController();