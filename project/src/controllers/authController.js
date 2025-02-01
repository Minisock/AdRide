import User from '../models/User.js';
import bcrypt from 'bcryptjs';
import { generateTokens } from '../utils/jwt.js';
import passport from 'passport';

export const register = async (req, res) => {
  try {
    const { name, email, password, confirmPassword, phone, role } = req.body;

    if (password !== confirmPassword) {
      return res.status(400).json({ error: 'Passwords do not match' });
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ error: 'Email already exists' });
    }

    const user = await User.create({ name, email, password, phone, role });

    const tokens = generateTokens(user);

    user.refreshTokens.push(tokens.refreshToken);
    await user.save();

    res.status(201).json(tokens);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Registration failed' });
  }
};

export const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    const tokens = generateTokens(user);

    user.refreshTokens.push(tokens.refreshToken);
    await user.save();

    res.status(200).json(tokens);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Login failed' });
  }
};

export const googleAuth = (req, res) => {
  passport.authenticate('google', { failureRedirect: '/login' }, async (err, user) => {
    if (err || !user) return res.status(400).json({ error: 'Authentication failed' });

    const tokens = generateTokens(user);
    res.status(200).json(tokens);
  })(req, res);
};

export const facebookAuth = (req, res) => {
  passport.authenticate('facebook', { failureRedirect: '/login' }, async (err, user) => {
    if (err || !user) return res.status(400).json({ error: 'Authentication failed' });

    const tokens = generateTokens(user);
    res.status(200).json(tokens);
  })(req, res);
};

export const twitterAuth = (req, res) => {
  passport.authenticate('twitter', { failureRedirect: '/login' }, async (err, user) => {
    if (err || !user) return res.status(400).json({ error: 'Authentication failed' });

    const tokens = generateTokens(user);
    res.status(200).json(tokens);
  })(req, res);
};

export const errorHandler = (err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
};

export const notFound = (req, res) => {
  res.status(404).json({ error: 'Route not found' });
};