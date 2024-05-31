import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

enum ToastType { warning, error, success, info }

class UtilsServices {
  String priceToCurrency(double price, {String? locale = 'pt_BR'}) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: locale);
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime, {String? locale = 'pt_BR'}) {
    //return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    initializeDateFormatting();
    return DateFormat.yMd(locale).add_Hm().format(dateTime);
  }

  void showToast(
    BuildContext context, {
    required String title,
    required String message,
    IconData? icon,
    ToastType type = ToastType.info,
    Text? action,
    Function? actionHandler,
  }) {
    var theme = {
      ToastType.warning: {
        'icon': Icons.warning,
        'themeColor': Colors.orange,
      },
      ToastType.error: {
        'icon': Icons.error,
        'themeColor': Colors.red,
      },
      ToastType.success: {
        'icon': Icons.check,
        'themeColor': Colors.green,
      },
      ToastType.info: {
        'icon': Icons.info_outline,
        'themeColor': Colors.blue,
      },
    };

    CherryToast(
      icon: icon ?? theme[type]!['icon'] as IconData,
      iconColor: theme[type]!['themeColor'] as Color,
      themeColor: theme[type]!['themeColor'] as Color,
      title: Text(
        title,
        style: TextStyle(
          color: theme[type]!['themeColor'] as Color,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      enableIconAnimation: false,
      animationType: AnimationType.fromLeft,
      animationDuration: const Duration(milliseconds: 500),
      toastDuration: const Duration(milliseconds: 4000),
      action: action,
      actionHandler: actionHandler,
      autoDismiss: true,
    ).show(context);

    // CherryToast.info(
    //   description: const Text(
    //     "All information may be deleted after this action",
    //     style: TextStyle(color: Colors.black),
    //   ),
    //   enableIconAnimation: false,
    //   animationType: AnimationType.fromLeft,
    //   animationDuration: const Duration(milliseconds: 500),
    //   toastDuration: const Duration(milliseconds: 4000),
    //   action: action,
    //   actionHandler: actionHandler,
    // ).show(context);
  }
}

// export instance
UtilsServices utilsServices = UtilsServices();
