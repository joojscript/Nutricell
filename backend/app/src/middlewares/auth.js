export default async (req, res, next) => {
  const [, token] = req.headers.authorization.split(' ');
  req.userId = token;
  return next();
};