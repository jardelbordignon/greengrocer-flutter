import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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
}

// export instance
UtilsServices utilsServices = UtilsServices();
