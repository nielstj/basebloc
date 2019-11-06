import 'package:fluro/fluro.dart';
import './routes_handler.dart';

class AppRouter {
  static Router router = Router();

  static String root = '/';
  static String themeSelect = '/theme';
  static String langSelect = '/select_languages';
  static String survey = '/survey';

  static void setupRouter() {
    router
      // ..notFoundHandler = missingRouteHandler
      ..define(root,
          handler: rootHandler, transitionType: TransitionType.fadeIn);
      // ..define(themeSelect,
      //     handler: themeHandler, transitionType: TransitionType.fadeIn)
      // ..define(langSelect,
      //     handler: langHandler, transitionType: TransitionType.fadeIn)
      // ..define(survey,
      //     handler: surveyHandler, transitionType: TransitionType.inFromBottom);
  }
}
