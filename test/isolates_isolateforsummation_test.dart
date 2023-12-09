import 'package:isolates_isolateforsummation/isolates_isolateforsummation.dart';
import 'package:test/test.dart';

void main() {
  test('sumListInIsolate sums up the list elements', () async {
    expect(await sumListInIsolate([1, 2, 3, 4, 5]), equals(15));
    expect(await sumListInIsolate([10, 20, 30]), equals(60));
  });

  test('sumListInIsolate handles empty list', () async {
    expect(await sumListInIsolate([]), equals(0));
  });
}