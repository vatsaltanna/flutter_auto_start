import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_auto_start_platform_interface.dart';

/// An implementation of [FlutterAutoStartPlatform] that uses method channels.
class MethodChannelFlutterAutoStart extends FlutterAutoStartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_auto_start');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
