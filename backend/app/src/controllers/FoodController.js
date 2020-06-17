import Food from "../models/Food";
import jwt from 'jsonwebtoken';
import { promisify } from 'util';
import authConfig from '../config/auth';

class FoodController {
  async store(req, res) {
    const {
      name,
      extraInfos,
      points,
      family,
      diabeticsAllowed = false,
      hypertesivesAllowed = false,
      lactoseIntolerantsAllowed = false,
    } = req.body;

    const foodExists = await Food.findOne({ name });

    if (foodExists) {
      return res.status(401).json({ error: 'The food you\'re trying to create already exists.' });
    }

    if (!(await promisify(jwt.verify)(req.userId, authConfig.secret))) {
      return res.state(401).json({ error: 'Invalid Token.' });
    }

    const food = await Food.create({
      name,
      extraInfos,
      points,
      family,
      diabeticsAllowed,
      hypertesivesAllowed,
      lactoseIntolerantsAllowed,
    });

    return res.status(200).json(food);

  }

  async index(req, res) {
    if (!(await promisify(jwt.verify)(req.userId, authConfig.secret))) {
      return res.json({ error: 'Invalid Token.' });
    }

    const results = await Food.find({}).limit(10);

    return res.json(results);
  }

  async getAndCompare(index, diabetic, lactoseIntolerant, hypertensive) {
    let veredict = [];

    const results = await Food.find({});

    results.map(food => {
      if (food.points <= index && food.points >= (index - 200)) {
        if (diabetic) {
          if (food.diabeticsAllowed) { veredict.push(food) }
        }
        if (lactoseIntolerant) {
          if (food.lactoseIntolerantsAllowed) { veredict.push(food) }
        }
        if (hypertensive) {
          if (food.hypertesivesAllowed) { veredict.push(food) }
        }
        if (!diabetic && !hypertensive && !lactoseIntolerant) {
          veredict.push(food);
        }
      }
    });

    return veredict;

  }

  async destroy(req, res) {
    if (!(await promisify(jwt.verify)(req.userId, authConfig.secret))) {
      return res.json({ error: 'Invalid Token.' });
    }

    const { foodId } = req.body;

    const response = await Food.deleteOne({ _id: foodId });

    return res.json(response);
  }

  async update(req, res) {
    const {
      foodId,
      name,
      extraInfos,
      points,
      family,
      diabeticsAllowed,
      hypertesivesAllowed,
      lactoseIntolerantsAllowed,
    } = req.body;

    const foodExists = await Food.findOne({ _id: foodId });

    if (!(await promisify(jwt.verify)(req.userId, authConfig.secret))) {
      return res.json({ error: 'Invalid Token.' });
    }

    if (!foodExists) {
      return res.status(401).json({ error: 'This food does not exist.' });
    }

    const response = await foodExists.update(req.body);

    return res.json(response);

  }

}

export default new FoodController();