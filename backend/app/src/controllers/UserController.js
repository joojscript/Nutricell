import User from '../models/Users';
import bc from 'bcryptjs';

class UserController {
  async index(req, res) {
    const response = await User.find({});

    return res.json(response);
  }

  async store(req, res) {
    const {
      email,
      password,
      age,
      height,
      weight,
      isDiabetic = false,
      isLactoseIntolerant = false,
      isHypertensive = false,
      name,
    } = req.body;

    const userExists = User.findOne({ email });

    if (!userExists) {
      return res.status(400).json({ error: 'User does not exist.' });
    }

    const hashedPassword = await bc.hash(password, 8);

    const user = await User.create({
      name,
      email,
      password: hashedPassword,
      age,
      height,
      weight,
      isDiabetic,
      isLactoseIntolerant,
      isHypertensive,
    });

    return res.status(200).json(user);

  }
}

export default new UserController();