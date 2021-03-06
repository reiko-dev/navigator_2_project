import 'package:flutter/cupertino.dart';
import 'package:navigator_2_project/route/book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    late final Uri uri;

    try {
      uri = Uri.parse(routeInformation.location!);
      // Handle '/'
      if (uri.pathSegments.length == 0) {
        return BookRoutePath.home();
      }

      // Handle '/book/:id'
      if (uri.pathSegments.length == 2) {
        if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
        var remaining = uri.pathSegments[1];
        var id = int.tryParse(remaining);
        if (id == null) return BookRoutePath.unknown();
        return BookRoutePath.details(id);
      }

      // Handle unknown routes
      return BookRoutePath.unknown();
    } catch (e) {
      return BookRoutePath.unknown();
    }
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }

    //path.isUnknown
    return RouteInformation(location: '/404');
  }
}
