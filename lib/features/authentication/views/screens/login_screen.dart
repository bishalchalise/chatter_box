import 'package:chatter_box/features/shared/views/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utilities/app_routes.dart';
import '../../../shared/views/widgets/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _headerBuilder(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _inputBuilder(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _loginButtonBuilder(context),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _forgetPasswordBuilder(context)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _registerBuilder(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svgs/auth.svg',
          color: Colors.deepPurple,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          'Welcome to the Chatter Box',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Keep your data safe!',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _inputBuilder() {
    return Column(
      children: const [
        AppInput(
          hintText: 'Enter Your Email Address',
        ),
        SizedBox(
          height: 10.0,
        ),
        AppInput(
          isPassword: true,
          hintText: 'Enter Your Password',
        ),
      ],
    );
  }

  Widget _loginButtonBuilder(final BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onPressed: () {
               Navigator.pushNamed(
              context,
              AppRoutes.chatsListScreen,
            ); 
            },
            value: "Login",
          ),
        ),
      ],
    );
  }

  Widget _forgetPasswordBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Forgot Password? ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _registerBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have an account? ",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.registerScreen,
            ); 
          },
          child: Text(
            'Register Now!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
