import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onLogoutPressed;
  final String titleText;

  const CustomAppBar({
    Key? key,
    required this.onBackPressed,
    required this.onNotificationPressed,
    required this.onLogoutPressed,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/back.png',
          width: 30,
          height: 30,
        ),
        onPressed: onBackPressed,
      ),
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: GoogleFonts.cabin(
          color: ColorConstants.primaryColor,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/images/notification.png',
            width: 30,
            height: 30,
          ),
          onPressed: onNotificationPressed,
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/logout.png',
            width: 30,
            height: 30,
          ),
          onPressed: onLogoutPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
