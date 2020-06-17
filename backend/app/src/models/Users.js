import mongoose from 'mongoose';

const UserSchema = mongoose.Schema({
  name: String,
  email: String,
  password: String,
  age: Number,
  height: Number,
  weight: Number,
  isDiabetic: Boolean,
  isLactoseIntolerant: Boolean,
  isHypertensive: Boolean,
});

export default mongoose.model('User', UserSchema);