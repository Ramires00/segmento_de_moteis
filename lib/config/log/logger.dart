import 'package:logging/logging.dart';

class Log {
  static final Logger log = Logger('Logger');

  static void info(String message, Object? error, StackTrace? stackTrace) =>
      log.info(
        message,
        error,
        stackTrace,
      );
  static void warning(String message, Object? error, StackTrace? stackTrace) =>
      log.warning(
        message,
        error,
        stackTrace,
      );
  static void error(String message, Object? error, StackTrace? stackTrace) =>
      log.severe(
        message,
        error,
        stackTrace,
      );
}
