import 'package:intl/intl.dart';

//formato para los decimales (en toda la app)
class HumanFormats{
  static String number (double number){
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      //tipo de moneda(USA):
      locale: 'en', 
    ).format(number);
    return formattedNumber;
  }
}