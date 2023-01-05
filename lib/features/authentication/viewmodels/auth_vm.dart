import 'dart:io';
import 'package:chatter_box/features/authentication/services/auth_service.dart';
import 'package:chatter_box/features/shared/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthVm extends ChangeNotifier {
  final BuildContext context;

  AuthVm({
    required this.context,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _photo;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  File? get photo => _photo;

  void login() async {
    await AuthService.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void registerUser() async {
    //register photo to firebase storage
    String? url;
    if (_photo != null) {
      final currentDate = DateTime.now();
      url = await StorageService.uploadFile(
          path: 'users/profile_picture/${currentDate.microsecondsSinceEpoch}.jpg',
          file: _photo!);
    }

    //register new user
    final uid = await AuthService.registerUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      photo: url,
    );
    if (uid != null) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      updatePhoto(
        File(pickedImage.path),
      );
    }
  }

  void updatePhoto(final File newVal) {
    _photo = newVal;
    notifyListeners();
  }
}
