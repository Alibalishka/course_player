import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:course_player/src/core/resources/app_images.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.profile).existsSync(), isTrue);
    expect(File(AppImages.robot).existsSync(), isTrue);
  });
}
