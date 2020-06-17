import mongoose from 'mongoose';

const FoodSchema = mongoose.Schema({
  name: String,
  extraInfos: String,
  points: Number,
  family: String,
  diabeticsAllowed: Boolean,
  hypertesivesAllowed: Boolean,
  lactoseIntolerantsAllowed: Boolean,
});

export default mongoose.model('Food', FoodSchema);