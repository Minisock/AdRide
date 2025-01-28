const Joi = require('joi');

const authValidation = {
  register: Joi.object({
    name: Joi.string().min(3).max(50).required().messages({
      'string.base': 'Name must be a string.',
      'string.empty': 'Name is required.',
      'string.min': 'Name must be at least 3 characters long.',
      'string.max': 'Name cannot exceed 50 characters.',
    }),
    email: Joi.string().email().required().messages({
      'string.email': 'Please provide a valid email address.',
      'string.empty': 'Email is required.',
    }),
    password: Joi.string().min(6).required().messages({
      'string.min': 'Password must be at least 6 characters long.',
      'string.empty': 'Password is required.',
    }),
  }),

  login: Joi.object({
    email: Joi.string().email().required().messages({
      'string.email': 'Please provide a valid email address.',
      'string.empty': 'Email is required.',
    }),
    password: Joi.string().required().messages({
      'string.empty': 'Password is required.',
    }),
  }),
};

module.exports = authValidation;
