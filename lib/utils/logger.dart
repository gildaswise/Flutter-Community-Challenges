import 'package:meta/meta.dart' show required;

class Logger {
  static const String TAG = "LOGGER";

  static void log(String tag, {@required String message}) {
    assert(tag != null);
    print("[$tag] $message");
  }
}
