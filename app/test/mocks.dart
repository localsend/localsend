import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/rust/api/webrtc.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([
  MockSpec<PersistenceService>(),
  MockSpec<SharedPreferences>(),
  MockSpec<LsSignalingConnection>(),
])
void main() {}
