import 'package:logger/logger.dart';

class Constants {
  static final Logger logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart));

          static const saweriaLink = "https://saweria.co/muuri";
}
