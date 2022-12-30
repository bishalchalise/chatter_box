
import 'package:chatter_box/features/authentication/viewmodels/auth_vm.dart';
import 'package:chatter_box/features/shared/views/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../shared/views/widgets/app_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthVm>(
      create: (context) {
        return AuthVm(context: context);
      },
      builder: ((context, child) {
        final vm = Provider.of<AuthVm>(context);
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
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
                            _imageBuilder(vm),
                            const SizedBox(
                              height: 20.0,
                            ),
                            _inputBuilder(vm),
                            const SizedBox(
                              height: 20.0,
                            ),
                            _loginButtonBuilder(vm),
                            const SizedBox(
                              height: 20.0,
                            ),
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
            ),
          ),
        );
      }),
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
          'Register to Chatter Box',
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

  Widget _imageBuilder(final AuthVm vm) {
    return GestureDetector(
      onTap: () {
        vm.pickImage();
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
          image: vm.photo == null
              ? null
              : DecorationImage(
                  image: FileImage(
                    vm.photo!),
                  fit: BoxFit.cover,
                ),
        ),
        child: vm.photo !=null ? null 
        :  const Center(
          child: Icon(
            Icons.image_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _inputBuilder(final AuthVm vm) {
    return Column(
      children: [
        AppInput(
          controller: vm.nameController,
          hintText: 'Username',
        ),
        const SizedBox(
          height: 10.0,
        ),
        AppInput(
          controller: vm.emailController,
          hintText: 'Email Address',
        ),
        const SizedBox(
          height: 10.0,
        ),
        AppInput(
          controller: vm.passwordController,
          isPassword: true,
          hintText: 'Password',
        ),
      ],
    );
  }

  Widget _loginButtonBuilder(final AuthVm vm) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onPressed: () {
              vm.register();
            },
            value: "Register",
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
          "Already have an account? ",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Login',
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
