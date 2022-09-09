import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_auto_start_method_channel.dart';

abstract class FlutterAutoStartPlatform extends PlatformInterface {
  /// Constructs a FlutterAutoStartPlatform.
  FlutterAutoStartPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAutoStartPlatform _instance = MethodChannelFlutterAutoStart();

  /// The default instance of [FlutterAutoStartPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAutoStart].
  static FlutterAutoStartPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAutoStartPlatform] when
  /// they register themselves.
  static set instance(FlutterAutoStartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
