#!/bin/bash

# Creating Backend Folder Structure
mkdir -p backend/src/config
mkdir -p backend/src/controllers
mkdir -p backend/src/routes
mkdir -p backend/src/models
mkdir -p backend/src/services
mkdir -p backend/src/middlewares
mkdir -p backend/src/utils
mkdir -p backend/src/validations
mkdir -p backend/src/database
mkdir -p backend/src/constants
mkdir -p backend/src/tests

# Creating Testing Folder Structure
mkdir -p testing/unit
mkdir -p testing/integration
mkdir -p testing/e2e

# Creating necessary files for Backend
touch backend/src/config/database.js
touch backend/src/config/env.js
touch backend/src/config/appConfig.js
touch backend/src/controllers/authController.js
touch backend/src/controllers/userController.js
touch backend/src/controllers/productController.js
touch backend/src/routes/authRoutes.js
touch backend/src/routes/userRoutes.js
touch backend/src/routes/productRoutes.js
touch backend/src/models/userModel.js
touch backend/src/models/productModel.js
touch backend/src/models/tokenModel.js
touch backend/src/services/authService.js
touch backend/src/services/userService.js
touch backend/src/services/productService.js
touch backend/src/middlewares/authMiddleware.js
touch backend/src/middlewares/errorHandler.js
touch backend/src/middlewares/requestLogger.js
touch backend/src/utils/emailUtil.js
touch backend/src/utils/jwtUtil.js
touch backend/src/utils/logger.js
touch backend/src/validations/authValidation.js
touch backend/src/validations/userValidation.js
touch backend/src/validations/productValidation.js
touch backend/src/database/seedData.js
touch backend/src/database/migration.js
touch backend/src/constants/roles.js
touch backend/src/constants/errorMessages.js
touch backend/src/tests/auth.test.js
touch backend/src/tests/user.test.js
touch backend/src/tests/product.test.js

# Creating placeholder README files (backend and testing)
touch backend/README.md
touch testing/README.md

# No changes to the frontend directory

echo "Folder structure created successfully!"

