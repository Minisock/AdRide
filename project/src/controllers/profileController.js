import User from '../models/User.js';
import Wall from '../models/Wall.js'; 
import Earnings from '../models/Earnings.js'; 
import SupportTicket from '../models/SupportTicket.js';
import bcrypt from 'bcryptjs';
import asyncHandler from 'express-async-handler';

// Get Profile
export const getProfile = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id)
    .select('-password -refreshTokens -__v')
    .lean();

  if (!user) {
    return res.status(404).json({
      success: false,
      error: 'User not found'
    });
  }

  res.json({
    success: true,
    data: user
  });
});

// Update Profile
export const updateProfile = asyncHandler(async (req, res) => {
  const updates = {
    name: req.body.name,
    email: req.body.email,
    phone: req.body.phone
  };

  if (req.file) {
    updates.profileImage = req.file.path;
  }

  const user = await User.findByIdAndUpdate(
    req.user._id,
    { $set: updates },
    { new: true, runValidators: true }
  ).select('-password -refreshTokens -__v');

  res.json({
    success: true,
    data: user
  });
});

// Change Password
export const changePassword = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id);
  const { oldPassword, newPassword } = req.body;

  if (!(await bcrypt.compare(oldPassword, user.password))) {
    return res.status(401).json({
      success: false,
      error: 'Current password is incorrect'
    });
  }

  user.password = newPassword;
  await user.save();

  res.json({
    success: true,
    message: 'Password updated successfully'
  });
});

// Get Notifications
export const getNotifications = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id)
    .select('notifications')
    .lean();

  res.json({
    success: true,
    data: user.notifications
  });
});

// Update Notifications
export const updateNotifications = asyncHandler(async (req, res) => {
  await User.findByIdAndUpdate(
    req.user._id,
    { $set: { notifications: req.body } },
    { runValidators: true }
  );

  res.json({
    success: true,
    message: 'Notifications updated successfully'
  });
});

// Get My Walls
export const getMyWalls = asyncHandler(async (req, res) => {
  const walls = await Wall.find({ owner: req.user._id }).lean();

  res.json({
    success: true,
    data: walls
  });
});

// Get Earnings and Payments
export const getEarnings = asyncHandler(async (req, res) => {
  const earnings = await Earnings.findOne({ user: req.user._id }).lean();

  if (!earnings) {
    return res.status(404).json({
      success: false,
      error: 'No earnings data found'
    });
  }

  res.json({
    success: true,
    data: earnings
  });
});

// Update Notification Preferences
export const updateNotificationPreferences = asyncHandler(async (req, res) => {
  await User.findByIdAndUpdate(
    req.user._id,
    { $set: { notificationPreferences: req.body } },
    { runValidators: true }
  );

  res.json({
    success: true,
    message: 'Notification preferences updated successfully'
  });
});


// Get Payments
export const getPayments = asyncHandler(async (req, res) => {
  const payments = await Payments.find({ user: req.user._id }).lean();

  if (!payments || payments.length === 0) {
    return res.status(404).json({
      success: false,
      error: 'No payments found for this user'
    });
  }

  res.json({
    success: true,
    data: payments
  });
});


// Create Support Ticket (Help and Support)
export const createSupportTicket = asyncHandler(async (req, res) => {
  const { subject, message } = req.body;

  const ticket = new SupportTicket({
    user: req.user._id,
    subject,
    message
  });

  await ticket.save();

  res.json({
    success: true,
    message: 'Support request submitted successfully'
  });
});

// Get Help and Support
export const getHelpAndSupport = asyncHandler(async (req, res) => {
  res.json({
    success: true,
    message: 'Help and support details can be found here.'
  });
});

// Get Terms and Privacy
export const getTermsAndPrivacy = asyncHandler(async (req, res) => {
  res.json({
    success: true,
    data: {
      terms: "Your terms of service text...",
      privacy: "Your privacy policy text..."
    }
  });
});

// Logout User
export const logoutUser = asyncHandler(async (req, res) => {
  res.json({
    success: true,
    message: 'Logged out successfully'
  });
});

// Get Notification Preferences (The newly added function)
export const getNotificationPreferences = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id)
    .select('notificationPreferences')
    .lean();

  if (!user) {
    return res.status(404).json({
      success: false,
      error: 'User not found'
    });
  }

  res.json({
    success: true,
    data: user.notificationPreferences
  });
});
