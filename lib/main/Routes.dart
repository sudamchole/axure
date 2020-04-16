
import 'package:axure/utils/BottomBar.dart';
import 'package:flutter/material.dart';

import '../main.dart';

/// App Routes Class -> Routing class
class AppRoutes{

  //--------------------------------------------------------------- Constants ------------------------------------------------------------------------

  static const String APP_ROUTE_BOTTOM = "/bottom_bar_home";



  //--------------------------------------------------------------- Methods --------------------------------------------------------------------------

  /// Get Routes Method -> Route
  /// @param -> routeSettings -> RouteSettings
  /// @usage -> Returns route based on requested route settings
  Route getRoutes(RouteSettings routeSettings){

    switch(routeSettings.name){

      case APP_ROUTE_BOTTOM : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) =>BottomBar(selectedIndex:3),
        );
      }

      default: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => BottomBar(),
          fullscreenDialog: true,
        );
      }
    }
  }
}
