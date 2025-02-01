// middlewares/profileMiddleware.js
export const getCommonProfileData = async (req, res, next) => {
    try {
      // Add common profile data to request object
      req.profileData = {
        userId: req.user._id,
        role: req.user.role,
        profileCompleted: req.user.profileCompleted
      };
      next();
    } catch (error) {
      next(error);
    }
  };