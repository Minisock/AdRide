import Joi from 'joi';

export const campaignSchema = Joi.object({
  wall: Joi.string().hex().length(24).required(),
  title: Joi.string().required(),
  budget: Joi.number().min(1).required(),
  startDate: Joi.date().required(),
  endDate: Joi.date().greater(Joi.ref('startDate')).required()
});