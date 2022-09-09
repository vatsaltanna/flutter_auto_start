import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_auto_start/flutter_auto_start_method_channel.dart';

void main() {
  MethodChannelFlutterAutoStart platform = MethodChannelFlutterAutoStart();
  const MethodChannel channel = MethodChannel('flutter_auto_start');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
