// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sync_provider.dart';

class SyncStateMapper extends ClassMapperBase<SyncState> {
  SyncStateMapper._();

  static SyncStateMapper? _instance;
  static SyncStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SyncStateMapper._());
      StoredSecurityContextMapper.ensureInitialized();
      ProtocolTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SyncState';

  static Function _$init(SyncState v) => (v as dynamic).init as Function;
  static dynamic _arg$init(f) => f<Future<void> Function()>();
  static const Field<SyncState, Function> _f$init = Field('init', _$init, arg: _arg$init);
  static Object _$rootIsolateToken(SyncState v) => v.rootIsolateToken;
  static const Field<SyncState, Object> _f$rootIsolateToken = Field('rootIsolateToken', _$rootIsolateToken);
  static Function _$httpClientFactory(SyncState v) => (v as dynamic).httpClientFactory as Function;
  static dynamic _arg$httpClientFactory(f) => f<CustomHttpClient Function(Duration, StoredSecurityContext)>();
  static const Field<SyncState, Function> _f$httpClientFactory = Field('httpClientFactory', _$httpClientFactory, arg: _arg$httpClientFactory);
  static StoredSecurityContext _$securityContext(SyncState v) => v.securityContext;
  static const Field<SyncState, StoredSecurityContext> _f$securityContext = Field('securityContext', _$securityContext);
  static DeviceInfoResult _$deviceInfo(SyncState v) => v.deviceInfo;
  static const Field<SyncState, DeviceInfoResult> _f$deviceInfo = Field('deviceInfo', _$deviceInfo);
  static String _$alias(SyncState v) => v.alias;
  static const Field<SyncState, String> _f$alias = Field('alias', _$alias);
  static int _$port(SyncState v) => v.port;
  static const Field<SyncState, int> _f$port = Field('port', _$port);
  static List<String>? _$networkWhitelist(SyncState v) => v.networkWhitelist;
  static const Field<SyncState, List<String>> _f$networkWhitelist = Field('networkWhitelist', _$networkWhitelist);
  static List<String>? _$networkBlacklist(SyncState v) => v.networkBlacklist;
  static const Field<SyncState, List<String>> _f$networkBlacklist = Field('networkBlacklist', _$networkBlacklist);
  static ProtocolType _$protocol(SyncState v) => v.protocol;
  static const Field<SyncState, ProtocolType> _f$protocol = Field('protocol', _$protocol);
  static String _$multicastGroup(SyncState v) => v.multicastGroup;
  static const Field<SyncState, String> _f$multicastGroup = Field('multicastGroup', _$multicastGroup);
  static int _$discoveryTimeout(SyncState v) => v.discoveryTimeout;
  static const Field<SyncState, int> _f$discoveryTimeout = Field('discoveryTimeout', _$discoveryTimeout);
  static bool _$serverRunning(SyncState v) => v.serverRunning;
  static const Field<SyncState, bool> _f$serverRunning = Field('serverRunning', _$serverRunning);
  static bool _$download(SyncState v) => v.download;
  static const Field<SyncState, bool> _f$download = Field('download', _$download);

  @override
  final MappableFields<SyncState> fields = const {
    #init: _f$init,
    #rootIsolateToken: _f$rootIsolateToken,
    #httpClientFactory: _f$httpClientFactory,
    #securityContext: _f$securityContext,
    #deviceInfo: _f$deviceInfo,
    #alias: _f$alias,
    #port: _f$port,
    #networkWhitelist: _f$networkWhitelist,
    #networkBlacklist: _f$networkBlacklist,
    #protocol: _f$protocol,
    #multicastGroup: _f$multicastGroup,
    #discoveryTimeout: _f$discoveryTimeout,
    #serverRunning: _f$serverRunning,
    #download: _f$download,
  };

  static SyncState _instantiate(DecodingData data) {
    return SyncState(
        init: data.dec(_f$init),
        rootIsolateToken: data.dec(_f$rootIsolateToken),
        httpClientFactory: data.dec(_f$httpClientFactory),
        securityContext: data.dec(_f$securityContext),
        deviceInfo: data.dec(_f$deviceInfo),
        alias: data.dec(_f$alias),
        port: data.dec(_f$port),
        networkWhitelist: data.dec(_f$networkWhitelist),
        networkBlacklist: data.dec(_f$networkBlacklist),
        protocol: data.dec(_f$protocol),
        multicastGroup: data.dec(_f$multicastGroup),
        discoveryTimeout: data.dec(_f$discoveryTimeout),
        serverRunning: data.dec(_f$serverRunning),
        download: data.dec(_f$download));
  }

  @override
  final Function instantiate = _instantiate;

  static SyncState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SyncState>(map);
  }

  static SyncState deserialize(String json) {
    return ensureInitialized().decodeJson<SyncState>(json);
  }
}

mixin SyncStateMappable {
  String serialize() {
    return SyncStateMapper.ensureInitialized().encodeJson<SyncState>(this as SyncState);
  }

  Map<String, dynamic> toJson() {
    return SyncStateMapper.ensureInitialized().encodeMap<SyncState>(this as SyncState);
  }

  SyncStateCopyWith<SyncState, SyncState, SyncState> get copyWith => _SyncStateCopyWithImpl(this as SyncState, $identity, $identity);
  @override
  String toString() {
    return SyncStateMapper.ensureInitialized().stringifyValue(this as SyncState);
  }

  @override
  bool operator ==(Object other) {
    return SyncStateMapper.ensureInitialized().equalsValue(this as SyncState, other);
  }

  @override
  int get hashCode {
    return SyncStateMapper.ensureInitialized().hashValue(this as SyncState);
  }
}

extension SyncStateValueCopy<$R, $Out> on ObjectCopyWith<$R, SyncState, $Out> {
  SyncStateCopyWith<$R, SyncState, $Out> get $asSyncState => $base.as((v, t, t2) => _SyncStateCopyWithImpl(v, t, t2));
}

abstract class SyncStateCopyWith<$R, $In extends SyncState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  StoredSecurityContextCopyWith<$R, StoredSecurityContext, StoredSecurityContext> get securityContext;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get networkWhitelist;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get networkBlacklist;
  $R call(
      {Future<void> Function()? init,
      Object? rootIsolateToken,
      CustomHttpClient Function(Duration, StoredSecurityContext)? httpClientFactory,
      StoredSecurityContext? securityContext,
      DeviceInfoResult? deviceInfo,
      String? alias,
      int? port,
      List<String>? networkWhitelist,
      List<String>? networkBlacklist,
      ProtocolType? protocol,
      String? multicastGroup,
      int? discoveryTimeout,
      bool? serverRunning,
      bool? download});
  SyncStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SyncStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SyncState, $Out> implements SyncStateCopyWith<$R, SyncState, $Out> {
  _SyncStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SyncState> $mapper = SyncStateMapper.ensureInitialized();
  @override
  StoredSecurityContextCopyWith<$R, StoredSecurityContext, StoredSecurityContext> get securityContext =>
      $value.securityContext.copyWith.$chain((v) => call(securityContext: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get networkWhitelist => $value.networkWhitelist != null
      ? ListCopyWith($value.networkWhitelist!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(networkWhitelist: v))
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get networkBlacklist => $value.networkBlacklist != null
      ? ListCopyWith($value.networkBlacklist!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(networkBlacklist: v))
      : null;
  @override
  $R call(
          {Future<void> Function()? init,
          Object? rootIsolateToken,
          CustomHttpClient Function(Duration, StoredSecurityContext)? httpClientFactory,
          StoredSecurityContext? securityContext,
          DeviceInfoResult? deviceInfo,
          String? alias,
          int? port,
          Object? networkWhitelist = $none,
          Object? networkBlacklist = $none,
          ProtocolType? protocol,
          String? multicastGroup,
          int? discoveryTimeout,
          bool? serverRunning,
          bool? download}) =>
      $apply(FieldCopyWithData({
        if (init != null) #init: init,
        if (rootIsolateToken != null) #rootIsolateToken: rootIsolateToken,
        if (httpClientFactory != null) #httpClientFactory: httpClientFactory,
        if (securityContext != null) #securityContext: securityContext,
        if (deviceInfo != null) #deviceInfo: deviceInfo,
        if (alias != null) #alias: alias,
        if (port != null) #port: port,
        if (networkWhitelist != $none) #networkWhitelist: networkWhitelist,
        if (networkBlacklist != $none) #networkBlacklist: networkBlacklist,
        if (protocol != null) #protocol: protocol,
        if (multicastGroup != null) #multicastGroup: multicastGroup,
        if (discoveryTimeout != null) #discoveryTimeout: discoveryTimeout,
        if (serverRunning != null) #serverRunning: serverRunning,
        if (download != null) #download: download
      }));
  @override
  SyncState $make(CopyWithData data) => SyncState(
      init: data.get(#init, or: $value.init),
      rootIsolateToken: data.get(#rootIsolateToken, or: $value.rootIsolateToken),
      httpClientFactory: data.get(#httpClientFactory, or: $value.httpClientFactory),
      securityContext: data.get(#securityContext, or: $value.securityContext),
      deviceInfo: data.get(#deviceInfo, or: $value.deviceInfo),
      alias: data.get(#alias, or: $value.alias),
      port: data.get(#port, or: $value.port),
      networkWhitelist: data.get(#networkWhitelist, or: $value.networkWhitelist),
      networkBlacklist: data.get(#networkBlacklist, or: $value.networkBlacklist),
      protocol: data.get(#protocol, or: $value.protocol),
      multicastGroup: data.get(#multicastGroup, or: $value.multicastGroup),
      discoveryTimeout: data.get(#discoveryTimeout, or: $value.discoveryTimeout),
      serverRunning: data.get(#serverRunning, or: $value.serverRunning),
      download: data.get(#download, or: $value.download));

  @override
  SyncStateCopyWith<$R2, SyncState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _SyncStateCopyWithImpl($value, $cast, t);
}
