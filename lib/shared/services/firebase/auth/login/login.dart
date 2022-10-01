import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../res/app_default.dart';
import '../../../../ui/app_theme/theme/utils/theme_utils.dart';
import '../../../info/package_info.dart';
import '../../../routes/app_routes.dart';
import '../auth_sevice.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Scaffold(
      backgroundColor:
          themes.isDark ? theme.backgroundColor : theme.primaryColorDark,
      body: SafeArea(
        child: FlutterLogin(
          title: AppInfo.appName,
          logo: AssetImage(
            SResourses.APP_ICON_ASSETS,
          ),
          logoTag: SResourses.APP_ICON_ASSETS,
          theme: LoginTheme(
            pageColorDark:
                themes.isDark ? theme.backgroundColor : theme.primaryColorDark,
            pageColorLight:
                themes.isDark ? theme.backgroundColor : theme.primaryColorDark,
            headerMargin: 25,
            cardInitialHeight: 250,
          ),
          onLogin: (data) async {
            return await authService.signInWithEmailAndPassoword(
                email: data.name, password: data.password);
          },
          onSignup: (data) async {
            return await authService.registerWithEmailAndPassoword(
                email: data.name, password: data.password);
          },
          onSubmitAnimationCompleted: () {
            Get.offNamed(
              AppRoutes.HOME,
            );
          },
          onRecoverPassword: (data) async {
            return await authService.sendPasswordReset(email: data);
          },
          loginProviders: [
            LoginProvider(
              icon: FontAwesomeIcons.google,
              label: 'Google',
              callback: () async {
                return await authService.signInWithGoogle();
              },
            ),
          ],
          messages: LoginMessages(
            userHint: 'Email',
            passwordHint: 'Password',
            confirmPasswordHint: 'Confirm',
            loginButton: 'LOGIN',
            signupButton: 'Register',
            forgotPasswordButton: 'Forgot your password?',
            recoverPasswordButton: 'Recover password',
            goBackButton: 'Go back',
            confirmPasswordError: 'Not match!',
            recoverPasswordDescription:
                'Enter your email and we will send you an email to reset your password',
            recoverPasswordSuccess: 'Recover email has been sent',
          ),
        ),
      ),
    );
  }
}
