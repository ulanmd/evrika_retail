import 'package:flutter/material.dart';

import 'config/evrika_colors.dart';

enum ToastType {
  error,
  warning,
  success,
}

class Toast {
  final BuildContext context;
  final String text;
  final int duration;

  Toast.error(this.context, this.text, {this.duration = 1}) {
    toast(context, ToastType.error, text, duration);
  }

  Toast.success(this.context, this.text, {this.duration = 1}) {
    toast(context, ToastType.success, text, duration);
  }

  Toast.warning(this.context, this.text, {this.duration = 1}) {
    toast(context, ToastType.warning, text, duration);
  }

  void toast(context, toastType, text, _duration) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: _duration),
        content: Row(
          children: [
            Icon(
              getIconData(toastType),
              color: Colors.white,
            ),
            const SizedBox(width: 15 / 2),
            Expanded(child: Text(text)),
          ],
        ),
        padding: const EdgeInsets.all(15 / 1.5),
        backgroundColor: getColor(toastType),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
      ),
    );
  }

  IconData getIconData(ToastType toastType) {
    switch (toastType) {
      case ToastType.error:
        return Icons.error_outline;
      case ToastType.warning:
        return Icons.warning_amber_outlined;
      case ToastType.success:
        return Icons.task_alt_outlined;
      default:
        return Icons.error;
    }
  }

  Color getColor(ToastType toastType) {
    switch (toastType) {
      case ToastType.error:
        return EvrikaColors.kErrorColor;
      case ToastType.warning:
        return EvrikaColors.kWarningColor;
      case ToastType.success:
        return EvrikaColors.kSuccessColor;
      default:
        return Colors.grey.shade800;
    }
  }
}