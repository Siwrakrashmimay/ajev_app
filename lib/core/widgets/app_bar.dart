import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar createAppBar(
    BuildContext context, {
    bool showBackButton = true,
    String titleText = '',
    VoidCallback? onNotificationTap,
    AppBarThemeMode themeMode = AppBarThemeMode.light, // Add a theme mode
  }) {
    final bool isDark = themeMode == AppBarThemeMode.dark;

    return AppBar(
      backgroundColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton)
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                size: 20,
              ),
            )
          else
            const SizedBox(width: 48),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                titleText,
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onNotificationTap,
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color:
                      isDark ? Colors.tealAccent.shade400 : Colors.red.shade400,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.tealAccent.shade700 : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}

enum AppBarThemeMode { light, dark } // Enum for light and dark modes