// routes/vehicleRoutes.js
import express from 'express';
import { 
  registerVehicle,
  getMyVehicles,
  updateVehicle,
  deleteVehicle
} from '../controllers/vehicleController.js';
import { upload } from '../middlewares/uploadMiddleware.js';
import { protect, authorize } from '../middlewares/authMiddleware.js';
import { getCommonProfileData } from '../middlewares/profileMiddleware.js'; 

const router = express.Router();

router.use(protect);
router.use(authorize('Autowala/HelmetWala'));
router.use(getCommonProfileData); // Add common profile middleware

router.route('/')
  .post(upload.array('images', 5), registerVehicle)
  .get(getMyVehicles);

router.route('/:id')
  .put(upload.array('images', 5), updateVehicle)
  .delete(deleteVehicle);

export default router;