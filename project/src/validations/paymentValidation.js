import Joi from 'joi';

export const paymentSchema = Joi.object({
  amount: Joi.number().positive().required(),
  currency: Joi.string().valid('INR', 'USD').required(),
  method: Joi.string().valid('upi', 'credit_card', 'debit_card').required()
});