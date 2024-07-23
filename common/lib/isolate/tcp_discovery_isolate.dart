import 'package:common/api_route_builder.dart';
import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

final isolateChildProvider = ReduxProvider<IsolateChildController, IsolateChildState>((ref) {
  throw 'Not initialized';
});