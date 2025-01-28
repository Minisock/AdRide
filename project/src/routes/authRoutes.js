const express = require('express');
const { registerUser, loginUser } = require('../controllers/authController');
const authValidation = require('../validations/authValidation');
const router = express.Router();

router.post('/register', async (req, res) => {
  try {
    const { error } = authValidation.register.validate(req.body);
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }

    await registerUser(req, res);
  } catch (error) {
    console.error('Error in register route:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

router.post('/login', async (req, res) => {
  try {
    const { error } = authValidation.login.validate(req.body);
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }

    await loginUser(req, res);
  } catch (error) {
    console.error('Error in login route:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;