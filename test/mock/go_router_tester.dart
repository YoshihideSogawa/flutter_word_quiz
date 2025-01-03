import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

class FakeGoRouter extends Fake implements GoRouter {
  String? lastLocation;

  Object? pushResult;

  @override
  void go(String location, {Object? extra}) {
    lastLocation = location;
  }

  @override
  Future<T?> push<T extends Object?>(String location, {Object? extra}) async {
    lastLocation = location;
    return pushResult as T?;
  }
}
