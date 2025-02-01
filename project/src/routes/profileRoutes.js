import express from 'express';
import {
  getProfile,
  updateProfile,
  changePassword,
  getNotifications,
  updateNotifications,
  getMyWalls,
  getEarnings,
  getPayments,
  getNotificationPreferences,
  updateNotificationPreferences,
  getHelpAndSupport,
  getTermsAndPrivacy,
  logoutUser
} from '../controllers/profileController.js';

import { upload, handleUploadErrors } from '../middlewares/uploadMiddleware.js';
import { authenticate } from '../middlewares/authMiddleware.js';

const router = express.Router();

// Protect all routes
router.use(authenticate);

// Profile routes
router.route('/')
  .get(getProfile)
  .put(upload.single('profileImage'), handleUploadErrors, updateProfile);

router.route('/password').put(changePassword);

// Notifications
router.route('/notifications')
  .get(getNotifications)
  .put(updateNotifications);

// My Walls
router.route('/my-walls').get(getMyWalls);

// Earnings and Payments
router.route('/earnings').get(getEarnings);
router.route('/payments').get(getPayments);

// Notification Preferences
router.route('/notification-preferences')
  .get(getNotificationPreferences)
  .put(updateNotificationPreferences);

// Help and Support
router.route('/help-and-support').get(getHelpAndSupport);

// Terms and Privacy
router.route('/terms-and-privacy').get(getTermsAndPrivacy);

// Logout
router.route('/logout').post(logoutUser);

export default router;
