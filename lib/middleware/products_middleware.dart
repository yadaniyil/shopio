import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shop/models/app_state.dart';

List<Middleware<AppState>> createProductsMiddleware() =>
    [LoggingMiddleware.printer()];