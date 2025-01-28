const express = require('express');
const { getAdWalls } = require('../controllers/userController');
const Joi = require('joi');
const router = express.Router();

const adWallValidation = Joi.object({
  userId: Joi.string().required().messages({
    'string.empty': 'User ID is required.',
  }),
});

router.get('/adwalls', async (req, res) => {
  const { error } = adWallValidation.validate(req.query);
  if (error) {
    return res.status(400).json({ error: error.details[0].message });
  }
  await getAdWalls(req, res);
});

module.exports = router;