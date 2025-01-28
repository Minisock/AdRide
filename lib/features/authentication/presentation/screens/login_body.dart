import 'package:app/features/splashscreen/routes.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants/icons.dart';
import 'package:app/shared/resources/enums/button_styles.dart';
import 'package:app/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:app/shared/widgets/text/custom_divided_text.dart';
import 'package:app/shared/widgets/input_fields/custom_input_fields.dart';
import 'package:app/shared/widgets/images/image.dart';
import 'package:app/core/constants/strings.dart';
import 'package:app/core/constants/dimensions.dart';
import 'package:app/shared/styles/app_typography.dart';
import 'package:app/shared/widgets/text/custom_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            const SizedBox(height: 30),
            _buildLoginMessage(),
            const SizedBox(height: 20),
            _buildInputFields(),
            const SizedBox(height: 20),
            _buildLoginButton(),
            const SizedBox(height: 10),
            _buildDividerText(),
            const SizedBox(height: 30),
            _buildSocialLoginButtons(),
            const SizedBox(height: 50),
            _buildSignupSection(),
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

  Widget _buildLoginMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        text: AppStrings.loginMsg1,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomInputField(
            labelText: AppStrings.email,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomInputField(
            labelText: AppStrings.password,
            controller: passwordController,
            obscureText: true,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
        label: AppStrings.signIn,
        onPressed: () {
          // Add your login logic here
        },
        type: ButtonType.secondary,
      ),
    );
  }

  Widget _buildDividerText() {
    return CustomTextDivider(
      text: AppStrings.signup,
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            // Handle Google Login
          },
          child: CustomImage(
            imagePath: Images.googleIcon,
            height: 60,
            width: 60,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle Facebook Login
          },
          child: CustomImage(
            imagePath: Images.facebookIcon,
            height: 50,
            width: 50,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle X Login
          },
          child: CustomImage(
            imagePath: Images.xIcon,
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }

  Widget _buildSignupSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: AppStrings.signupMsg,
          style: AppTypography.bodyText2,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            // Navigate to Signup Screen
            Navigator.pushNamed(context, AppRoutes.signUp);
          },
          child: CustomText(
            text: AppStrings.signup,
            color: const Color.fromARGB(255, 51, 51, 240),
            style: AppTypography.button,
          ),
        ),
      ],
    );
  }
}
