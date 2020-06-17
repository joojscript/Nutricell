import express from 'express';
import mongoose from 'mongoose';
import routes from './routes';
import cors from 'cors';

class App {
  constructor() {
    this.server = express();

    this.middlewares();
    this.routes();

    // Username and password on the code just for academic reasons.

    this.connection = mongoose.connect('mongodb://admin:docker@localhost:27017/nutricell?authSource=admin', {
      useNewUrlParser: true,
      useUnifiedTopology: true
    });
  }

  middlewares() { }

  routes() {
    this.server.use(cors());
    this.server.use(express.json());
    this.server.use(routes);
  }

}

export default new App().server;