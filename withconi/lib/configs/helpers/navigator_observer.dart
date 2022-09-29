import 'package:flutter/material.dart';

class WcNavigatorObserver extends NavigatorObserver {
  /// The [Navigator] pushed `route`.
  ///
  /// The route immediately below that one, and thus the previously active
  /// route, is `previousRoute`.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // print('didPush');
    // print('route : $route');
    // print('previousRoute : $previousRoute');
  }

  /// The [Navigator] popped `route`.
  ///
  /// The route immediately below that one, and thus the newly active
  /// route, is `previousRoute`.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // print('didPop');
    // print('route : $route');
    // print('previousRoute : $previousRoute');
  }

  /// The [Navigator] removed `route`.
  ///
  /// If only one route is being removed, then the route immediately below
  /// that one, if any, is `previousRoute`.
  ///
  /// If multiple routes are being removed, then the route below the
  /// bottommost route being removed, if any, is `previousRoute`, and this
  /// method will be called once for each removed route, from the topmost route
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    // print('didPop');
    // print('route : $route');
    // print('previousRoute : $previousRoute');
  }

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  ///
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // print('didReplace');
    // print('newRoute : $newRoute');
    // print('oldRoute : $oldRoute');
  }

  /// The [Navigator]'s routes are being moved by a user gesture.
  ///
  /// For example, this is called when an iOS back gesture starts, and is used
  /// to disabled hero animations during such interactions.
  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    // print('didStartUserGesture');
    // print('route : $route');
    // print('previousRoute : $previousRoute');
  }

  /// User gesture is no longer controlling the [Navigator].
  ///
  /// Paired with an earlier call to [didStartUserGesture].
  ///
  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    // print('didStopUserGesture');
  }
}
