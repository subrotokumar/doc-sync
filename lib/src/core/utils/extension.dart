import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
  (double, double) get screenSize {
    final s = MediaQuery.of(this).size;
    return (s.width, s.height);
  }

  void unfocus() => FocusScope.of(this).unfocus();

  ThemeData get themeData => Theme.of(this);

  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  void showToast({
    required String title,
    String? subtitle,
    ToastType type = ToastType.normal,
    Duration? duration,
  }) {
    final ScaffoldMessengerState sm = ScaffoldMessenger.of(this);
    if (!mounted) return;
    sm.clearSnackBars();
    HapticFeedback.mediumImpact();
    duration = duration ?? 1500.milliseconds;
    sm.showSnackBar(
      SnackBar(
        elevation: 0,
        duration: duration,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                tileColor: type.backGround,
                minLeadingWidth: 16,
                leading: Icon(
                  Icons.error,
                  color: type.iconColor,
                ),
                title: Text(
                  title,
                  style: Poppins(
                    color: type.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: subtitle == null
                    ? null
                    : Text(
                        subtitle,
                        style: Poppins(color: type.textColor),
                      ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  alignment: Alignment.bottomCenter,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 1, end: 0),
                    duration: duration,
                    builder: (ctx, val, child) => LinearProgressIndicator(
                      value: val,
                      color: type.iconColor,
                      backgroundColor: type.backGround,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension DurationExtension on int {
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
}

extension ToastTypeExtension on ToastType {
  Color get iconColor => switch (this) {
        ToastType.info => const Color(0xff2071ee),
        ToastType.warning => const Color(0xffe28e1a),
        ToastType.error => const Color(0xffe1191f),
        _ => const Color(0xff010101),
      };
  Color get backGround => switch (this) {
        ToastType.info => const Color(0xffbedcf6),
        ToastType.warning => const Color(0xfffcf4e8),
        ToastType.error => const Color(0xfffce8e9),
        _ => const Color(0xffefeff2),
      };

  Color get textColor => switch (this) {
        ToastType.info => const Color(0xff0e2f63),
        ToastType.warning => const Color(0xff5f3c0c),
        ToastType.error => const Color(0xff5f0c0e),
        _ => const Color(0xff1e1e2e),
      };
}

extension ButtonSizeExtension on ButtonSize {
  double get height => switch (this) {
        ButtonSize.small => 40,
        ButtonSize.medium => 48,
        ButtonSize.large => 56,
      };
  double get textSize => switch (this) {
        ButtonSize.small => 12,
        ButtonSize.medium => 14,
        ButtonSize.large => 16,
      };
}
