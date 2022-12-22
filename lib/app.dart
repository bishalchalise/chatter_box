// import 'package:chatter_box/features/authentication/views/screens/login_screen.dart';
// import 'package:chatter_box/features/authentication/views/screens/register_screen.dart';
import 'package:chatter_box/utilities/app_router.dart';
import 'package:chatter_box/utilities/app_routes.dart';
import 'package:chatter_box/utilities/app_themes.dart';
import 'package:flutter/material.dart';

class ChatterBox extends StatelessWidget {
  const ChatterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter Box',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightPalette,
      darkTheme: AppTheme().darkPalette,
      initialRoute: AppRoutes.loginScreen,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
