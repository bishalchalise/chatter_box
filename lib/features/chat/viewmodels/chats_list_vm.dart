import 'package:flutter/material.dart';

class ChatsListVm extends ChangeNotifier {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  bool get isSearchActive => _isSearchActive;
  TextEditingController get searchController => _searchController;

  void clearController() {
    updateIsSearchActive(false);
    _searchController.text = '';
  }

  // upload value of isSearchActive

  void updateIsSearchActive(final bool newVal) {
    _isSearchActive = newVal;
    notifyListeners();
  }
}
