import express from 'express';
import { 
  createWall, 
  getWallStats, 
  getMyWalls, 
  updateWall, 
  deleteWall, 
  searchWalls, 
  getWallById 
} from '../controllers/wallController.js';
import { upload } from '../middlewares/uploadMiddleware.js';
import { protect } from '../middlewares/authMiddleware.js';

const router = express.Router();

router.use(protect);

router.route('/')
  .post(upload.array('images', 5), createWall)
  .get(getMyWalls); 

router.route('/stats').get(getWallStats); 
router.route('/search').get(searchWalls); 

router.route('/:id')
  .get(getWallById) 
  .put(upload.array('images', 5), updateWall)
  .delete(deleteWall); 

export default router;
