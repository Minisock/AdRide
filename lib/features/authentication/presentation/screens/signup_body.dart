import 'package:app/features/splashscreen/routes.dart';
import 'package:app/shared/widgets/dropdownfields/dropdownfields.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants/dimensions.dart';
import 'package:app/core/constants/icons.dart';
import 'package:app/core/constants/strings.dart';
import 'package:app/shared/resources/enums/button_styles.dart';
import 'package:app/shared/styles/app_typography.dart';
import 'package:app/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:app/shared/widgets/images/image.dart';
import 'package:app/shared/widgets/input_fields/custom_input_fields.dart';
import 'package:app/shared/widgets/text/custom_divided_text.dart';
import 'package:app/shared/widgets/text/custom_text.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
   String? selectedRole; // Holds the selected value
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLogo(),
            
            _buildSignUpMessage(),
            const SizedBox(height: 20),
            _buildInputFields(),
            const SizedBox(height: 20),
            _buildSignUpButton(),
            const SizedBox(height: 10),
            _buildDividerText(),
            const SizedBox(height: 30),
            _buildSocialLoginButtons(),
            const SizedBox(height: 50),
            _buildLoginSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CustomImage(
          imagePath: Images.appImage,
          height: 200,
          width: 350,
        ),
      ),
    );
  }

  Widget _buildSignUpMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        text: AppStrings.signupMsg,
        style: AppTypography.headline1,
        fontWeight: FontWeight.w900,
        fontSize: Dimensions.fontExtraLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        _buildInputField(AppStrings.name, nameController, TextInputType.name),
        _buildInputField(AppStrings.email, emailController, TextInputType.emailAddress),
        _buildInputField(AppStrings.password, passwordController, TextInputType.visiblePassword, obscureText: true),
        _buildInputField(AppStrings.confirmPassword, confirmPasswordController, TextInputType.visiblePassword, obscureText: true),
        const SizedBox(height: 10),
            CustomDropdownField(
              labelText: "Role",
              items: ['Admin', 'Operators', 'Advertisement', 'WallOwners'],
              selectedValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value;
                });
              },
            ),
      ],
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller, TextInputType keyboardType, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomInputField(
        labelText: labelText,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
        label: AppStrings.signup,
        onPressed: _handleSignUp,
        type: ButtonType.secondary,
      ),
    );
  }

  void _handleSignUp() {
    // Add your signup logic here
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showError("Please fill all fields");
    } else if (password != confirmPassword) {
      _showError("Passwords do not match");
    } else {
      // Proceed with signup logic
      print("Name: $name, Email: $email");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildDividerText() {
    return CustomTextDivider(
      text: AppStrings.login,
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(Images.googleIcon, () {
          // Handle Google Login
        }),
        _buildSocialButton(Images.facebookIcon, () {
          // Handle Facebook Login
        }),
        _buildSocialButton(Images.xIcon, () {
          // Handle X Login
        }),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CustomImage(
        imagePath: imagePath,
        height: 50,
        width: 50,
      ),
    );
  }

  Widget _buildLoginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: AppStrings.loginMsg2,
          style: AppTypography.bodyText2,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            // Navigate to Login Screen
            Navigator.pushNamed(context, AppRoutes.login);
          },
          child: CustomText(
            text: AppStrings.login,
            color: const Color.fromARGB(255, 51, 51, 240),
            style: AppTypography.button,
          ),
        ),
      ],
    );
  }
}
