import User from '../models/Users';
import bc from 'bcryptjs';
import jwt from 'jsonwebtoken';

import authConfig from '../config/auth';

class SessionController {
  async store(req, res) {
    const { email, password } = req.body;

    const userExists = await User.findOne({ email });

    if (!userExists) {
      return res.json(401).json({ error: 'User does not exist or is not an admin.' });
    }

    const passwordValidates = await bc.compare(password, userExists.password);

    if (!passwordValidates) {
      return res.status(401).json({ error: 'Password does not match.' });
    }

    return res.status(200).json(
      {
        user: userExists.id,
        token: jwt.sign({ id: userExists.id },
          authConfig.secret,
          { expiresIn: authConfig.expiresIn }
        )
      });

  }
}

export default new SessionController();