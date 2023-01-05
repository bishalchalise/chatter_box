import 'dart:io';

import 'package:chatter_box/features/chat/services/chat_services.dart';
import 'package:chatter_box/features/shared/services/storage_service.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/message_model.dart';

class ChatConvoVm extends ChangeNotifier {
  final BuildContext context;
  ChatConvoVm({required this.context});
  final TextEditingController _messageController = TextEditingController();
  List<File> _selectedPictures = [];

  TextEditingController get messageController => _messageController;
  List<File> get selectedPictures => _selectedPictures;

  void sendMessage({
    final String? chatId,
    required final AppUser? appUser,
    required final AppUser? user,
  }) async {
    List<String> files = [];
    if (_selectedPictures.isNotEmpty) {
      for (final selectedPicture in _selectedPictures) {
        final currentDate = DateTime.now();
        final pictureUrl = await StorageService.uploadFile(
          path:
              'users/${appUser?.id}/${currentDate.millisecondsSinceEpoch}.jpg',
          file: selectedPicture,
        );
        if (pictureUrl != null) {
          files.add(pictureUrl);
        }
      }

      updateSelectedPictures([]);
    }
    final text = _messageController.text;
    final message = Message(
      senderId: appUser!.id,
      recieverIds: [user!.id],
      text: text,
      files: files,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    ChatService.sendMessage(
      chatId: chatId,
      message: message,
    );

    _messageController.text = '';
  }

// pick imae
  void pickImage() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages.isNotEmpty) {
      final files = pickedImages.map((e) => File(e.path)).toList();
      updateSelectedPictures(
        files
      );
    }
  }

// update value of picture
  void updateSelectedPictures(final List<File> newVal) {
    _selectedPictures = newVal;
    notifyListeners();
  }
}
