import 'dart:io';

import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function() onPressedSend;
  final Function() onPressedSelect;
  final Function(File) onPressedRemoveImage;
  final List<File?> selectedPictures;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onPressedSend,
    required this.onPressedSelect,
    required this.selectedPictures,
    required this.onPressedRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (selectedPictures.isNotEmpty)
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              itemCount: selectedPictures.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final selectedPicture = selectedPictures[index];
                return Container(
                  height: 100.0,
                  width: 80.0,
                  margin: const EdgeInsets.all(
                    10.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: FileImage(selectedPicture!),
                        fit: BoxFit.cover,
                      )),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        onPressedRemoveImage(
                          selectedPicture
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.cancel_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  onPressedSelect();
                },
                behavior: HitTestBehavior.opaque,
                child: const Icon(
                  Icons.image,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Write Something..'),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: onPressedSend,
                behavior: HitTestBehavior.opaque,
                child: const Icon(
                  Icons.send,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
