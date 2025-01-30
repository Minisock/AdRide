import express from 'express';
import { register, login, googleAuth, facebookAuth, twitterAuth } from '../controllers/authController.js';
import passport from 'passport';

const router = express.Router();

router.post('/register', register);
router.post('/login', login);

router.get('/google', passport.authenticate('google', { scope: ['profile', 'email'] }));
router.get('/google/callback', googleAuth);

router.get('/facebook', passport.authenticate('facebook', { scope: ['email'] }));
router.get('/facebook/callback', facebookAuth);

router.get('/twitter', passport.authenticate('twitter'));
router.get('/twitter/callback', twitterAuth);

export default router;
