import { paymentMethods } from '../constants/paymentMethods.js';

export const validatePayment = (req, res, next) => {
  if (!paymentMethods.includes(req.body.method)) {
    return res.status(400).json({ error: 'Invalid payment method' });
  }
  if (!req.body.amount || req.body.amount <= 0) {
    return res.status(400).json({ error: 'Invalid amount' });
  }
  next();
};