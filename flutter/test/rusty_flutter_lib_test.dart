import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rusty_flutter_lib/rusty_flutter_lib.dart';

void main() {
  const MethodChannel channel = MethodChannel('rusty_flutter_lib');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await RustyFlutterLib.platformVersion, '42');
  });
}
