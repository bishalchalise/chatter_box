import 'package:chatter_box/features/chat/model/chat_model.dart';
import 'package:chatter_box/features/chat/viewmodels/chats_list_vm.dart';
import 'package:chatter_box/features/chat/views/widgets/chats_list_widgets/chats_list.dart';
import 'package:chatter_box/features/user/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utilities/app_routes.dart';
import '../../../authentication/services/auth_service.dart';
import '../../../shared/views/widgets/app_input.dart';
import '../../../user/views/users_list_widgets/user_list.dart';
import 'chat_convo_screen.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatsListVm(),
      builder: (context, child) {
        final vm = Provider.of<ChatsListVm>(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: _searchBuilder(vm),
          ),
          body: vm.isSearchActive
              ? _searchResultsBuilder(vm)
              : _chatsListBuilder(context),
        );
      },
    );
  }

  Widget _searchResultsBuilder(final ChatsListVm vm) {
    return StreamBuilder(
      stream: UserService.getUserByName(
        name: vm.searchController.text,
      ),
      builder: (context, snap) {
        if (snap.hasData) {
          final users = snap.data ?? [];
          return UsersList(
              users: users,
              onPressedUser: (user) {
                FocusScope.of(context).unfocus();
                vm.clearController();
                Navigator.pushNamed(
                  context,
                  AppRoutes.chatConvoScreen,
                  arguments: ChatConvoScreenArgs(
                    user: user,
                    
                  ),
                );
              });
        }
        return Container();
      },
    );
  }

  Widget _chatsListBuilder(final BuildContext context) {
    final chats = Provider.of<List<Chat>>(context);
    return ChatsList(
      chats: chats,
    );
  }

  Widget _searchBuilder(final ChatsListVm vm) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
          bottom: 5.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: AppInput(
                  hintText: 'Search Users',
                  controller: vm.searchController,
                  onchanged: (val) {
                    if (val == '') {
                      vm.updateIsSearchActive(false);
                    } else {
                      vm.updateIsSearchActive(true);
                    }
                  }),
            ),
            IconButton(
              onPressed: () {
                AuthService.logoutUser();
                // ChatService.sendMessage();
              },
              icon: const Icon(
                Icons.logout_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}
