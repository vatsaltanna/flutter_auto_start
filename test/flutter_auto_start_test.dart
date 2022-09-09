import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_auto_start/flutter_auto_start.dart';
import 'package:flutter_auto_start/flutter_auto_start_platform_interface.dart';
import 'package:flutter_auto_start/flutter_auto_start_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAutoStartPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterAutoStartPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAutoStartPlatform initialPlatform = FlutterAutoStartPlatform.instance;

  test('$MethodChannelFlutterAutoStart is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAutoStart>());
  });

  test('getPlatformVersion', () async {
    FlutterAutoStart flutterAutoStartPlugin = FlutterAutoStart();
    MockFlutterAutoStartPlatform fakePlatform = MockFlutterAutoStartPlatform();
    FlutterAutoStartPlatform.instance = fakePlatform;
  
    expect(await flutterAutoStartPlugin.getPlatformVersion(), '42');
  });
}
