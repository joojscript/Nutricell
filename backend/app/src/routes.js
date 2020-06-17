import { Router } from 'express';
const routes = Router();

import authMiddleware from './middlewares/auth';

import UserController from './controllers/UserController';
import SessionController from './controllers/SessionController';
import FoodController from './controllers/FoodController';
import HomeController from './controllers/HomeController';
import Food from './models/Food';

routes.get('/users', UserController.index);
routes.post('/users', UserController.store);

routes.post('/sessions', SessionController.store);

routes.use(authMiddleware);

routes.get('/foods', FoodController.index);
routes.post('/foods', FoodController.store);
routes.put('/foods', FoodController.update);
routes.delete('/foods', FoodController.destroy);

routes.get('/home', HomeController.index);

export default routes;