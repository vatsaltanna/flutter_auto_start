
import 'flutter_auto_start_platform_interface.dart';

class FlutterAutoStart {
  Future<String?> getPlatformVersion() {
    return FlutterAutoStartPlatform.instance.getPlatformVersion();
  }
}
