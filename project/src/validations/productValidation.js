const Joi = require('joi');

const productValidation = {
  create: Joi.object({
    name: Joi.string().min(3).max(100).required().messages({
      'string.base': 'Product name must be a string.',
      'string.empty': 'Product name is required.',
      'string.min': 'Product name must be at least 3 characters long.',
      'string.max': 'Product name cannot exceed 100 characters.',
    }),
    price: Joi.number().positive().required().messages({
      'number.base': 'Price must be a number.',
      'number.positive': 'Price must be a positive number.',
      'any.required': 'Price is required.',
    }),
    stock: Joi.number().integer().min(0).required().messages({
      'number.base': 'Stock must be a number.',
      'number.min': 'Stock cannot be less than 0.',
      'any.required': 'Stock is required.',
    }),
    description: Joi.string().max(500).optional().messages({
      'string.base': 'Description must be a string.',
      'string.max': 'Description cannot exceed 500 characters.',
    }),
  }),

  update: Joi.object({
    name: Joi.string().min(3).max(100).optional().messages({
      'string.base': 'Product name must be a string.',
      'string.min': 'Product name must be at least 3 characters long.',
      'string.max': 'Product name cannot exceed 100 characters.',
    }),
    price: Joi.number().positive().optional().messages({
      'number.base': 'Price must be a number.',
      'number.positive': 'Price must be a positive number.',
    }),
    stock: Joi.number().integer().min(0).optional().messages({
      'number.base': 'Stock must be a number.',
      'number.min': 'Stock cannot be less than 0.',
    }),
    description: Joi.string().max(500).optional().messages({
      'string.base': 'Description must be a string.',
      'string.max': 'Description cannot exceed 500 characters.',
    }),
  }),
};

module.exports = productValidation;
