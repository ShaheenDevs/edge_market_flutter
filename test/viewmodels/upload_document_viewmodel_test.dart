import 'package:flutter_test/flutter_test.dart';
import 'package:edge_market/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UploadDocumentViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
