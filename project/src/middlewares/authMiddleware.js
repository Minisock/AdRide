import jwt from 'jsonwebtoken';
import mongoose from 'mongoose';
import { ACCESS_TOKEN_SECRET } from '../config/env.js';
import User from '../models/User.js';

export const protect = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    
    if (!authHeader?.startsWith('Bearer ')) {
      return res.status(401).json({ 
        success: false,
        error: 'Unauthorized - No Token Provided' 
      });
    }

    const token = authHeader.split(' ')[1];

    try {
      const decoded = jwt.verify(token, ACCESS_TOKEN_SECRET);
      const user = await User.findById(decoded.userId)
        .select('-password -refreshTokens')
        .lean();

      if (!user) {
        return res.status(401).json({ 
          success: false,
          error: 'User not found' 
        });
      }

      req.user = user;
      next();
    } catch (jwtError) {
      return res.status(401).json({ 
        success: false,
        error: 'Invalid or Expired Token' 
      });
    }
  } catch (err) {
    next(err);
  }
};

export const authenticate = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    
    if (!authHeader?.startsWith('Bearer ')) {
      return res.status(401).json({ 
        success: false,
        error: 'Unauthorized - No Token Provided' 
      });
    }

    const token = authHeader.split(' ')[1];
    
    try {
      const decoded = jwt.verify(token, ACCESS_TOKEN_SECRET);
      const user = await User.findById(decoded.userId)
        .select('-password -refreshTokens')
        .lean();

      if (!user) {
        return res.status(401).json({ 
          success: false,
          error: 'User not found' 
        });
      }

      req.user = user;
      next();
    } catch (jwtError) {
      return res.status(401).json({ 
        success: false,
        error: 'Invalid or Expired Token' 
      });
    }
  } catch (err) {
    next(err);
  }
};

export const authorize = (...roles) => (req, res, next) => {
  if (!roles.includes(req.user.role)) {
    return res.status(403).json({ 
      success: false,
      error: `Access denied. Required roles: ${roles.join(', ')}` 
    });
  }
  next();
};

export const checkOwnership = (modelName) => async (req, res, next) => {
  try {
    const doc = await mongoose.model(modelName).findOne({
      _id: req.params.id,
      owner: req.user._id
    });

    if (!doc) {
      return res.status(403).json({ 
        success: false,
        error: 'You are not authorized to modify this resource' 
      });
    }
    
    next();
  } catch (err) {
    next(err);
  }
};