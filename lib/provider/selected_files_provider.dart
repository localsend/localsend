import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/cross_file.dart';

final selectedFilesProvider = StateProvider<List<CrossFile>>((ref) => []);
