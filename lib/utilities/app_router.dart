import 'package:chatter_box/features/authentication/views/screens/login_screen.dart';
import 'package:chatter_box/features/authentication/views/screens/register_screen.dart';
import 'package:chatter_box/features/chat/views/screens/chats_list_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppRouter {
  Route onGenerateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return _buildRoute(settings, const LoginScreen());
      case AppRoutes.registerScreen:
        return _buildRoute(settings, const RegisterScreen());
        case AppRoutes.chatsListScreen:
        return _buildRoute(settings, const ChatsListScreen());  
      default: 
       return _buildRoute(settings, const LoginScreen()); 
    }
  }

  Route _buildRoute(final RouteSettings settings, final Widget widget) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
