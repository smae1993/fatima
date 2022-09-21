import 'package:fatima/fatima.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FatimaInformationParser extends RouteInformationParser<RouteDecoder> {
  final String initialRoute;

  FatimaInformationParser({
    required this.initialRoute,
  }) {
    Fatima.log('GetInformationParser is created !');
  }
  @override
  SynchronousFuture<RouteDecoder> parseRouteInformation(
    RouteInformation routeInformation,
  ) {
    var location = routeInformation.location;
    if (location == '/') {
      //check if there is a corresponding page
      //if not, relocate to initialRoute
      if (!(Fatima.rootController.routerDelegate as FatimaDelegate)
          .registeredRoutes
          .any((element) => element.name == '/')) {
        location = initialRoute;
      }
    }

    Fatima.log('GetInformationParser: route location: $location');

    final routeName = location ?? initialRoute;

    return SynchronousFuture(RouteDecoder.fromRoute(routeName));
  }

  @override
  RouteInformation restoreRouteInformation(RouteDecoder configuration) {
    return RouteInformation(
      location: configuration.pageSettings?.name,
      state: null,
    );
  }
}
