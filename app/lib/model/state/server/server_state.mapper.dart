// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'server_state.dart';

class ServerStateMapper extends ClassMapperBase<ServerState> {
  ServerStateMapper._();

  static ServerStateMapper? _instance;
  static ServerStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerStateMapper._());
      ReceiveSessionStateMapper.ensureInitialized();
      WebSendStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ServerState';

  static HttpServer _$httpServer(ServerState v) => v.httpServer;
  static const Field<ServerState, HttpServer> _f$httpServer =
      Field('httpServer', _$httpServer);
  static String _$alias(ServerState v) => v.alias;
  static const Field<ServerState, String> _f$alias = Field('alias', _$alias);
  static int _$port(ServerState v) => v.port;
  static const Field<ServerState, int> _f$port = Field('port', _$port);
  static bool _$https(ServerState v) => v.https;
  static const Field<ServerState, bool> _f$https = Field('https', _$https);
  static ReceiveSessionState? _$session(ServerState v) => v.session;
  static const Field<ServerState, ReceiveSessionState> _f$session =
      Field('session', _$session);
  static WebSendState? _$webSendState(ServerState v) => v.webSendState;
  static const Field<ServerState, WebSendState> _f$webSendState =
      Field('webSendState', _$webSendState);

  @override
  final Map<Symbol, Field<ServerState, dynamic>> fields = const {
    #httpServer: _f$httpServer,
    #alias: _f$alias,
    #port: _f$port,
    #https: _f$https,
    #session: _f$session,
    #webSendState: _f$webSendState,
  };

  static ServerState _instantiate(DecodingData data) {
    return ServerState(
        httpServer: data.dec(_f$httpServer),
        alias: data.dec(_f$alias),
        port: data.dec(_f$port),
        https: data.dec(_f$https),
        session: data.dec(_f$session),
        webSendState: data.dec(_f$webSendState));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerState>(map);
  }

  static ServerState deserialize(String json) {
    return ensureInitialized().decodeJson<ServerState>(json);
  }
}

mixin ServerStateMappable {
  String serialize() {
    return ServerStateMapper.ensureInitialized()
        .encodeJson<ServerState>(this as ServerState);
  }

  Map<String, dynamic> toJson() {
    return ServerStateMapper.ensureInitialized()
        .encodeMap<ServerState>(this as ServerState);
  }

  ServerStateCopyWith<ServerState, ServerState, ServerState> get copyWith =>
      _ServerStateCopyWithImpl(this as ServerState, $identity, $identity);
  @override
  String toString() {
    return ServerStateMapper.ensureInitialized()
        .stringifyValue(this as ServerState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServerStateMapper.ensureInitialized()
                .isValueEqual(this as ServerState, other));
  }

  @override
  int get hashCode {
    return ServerStateMapper.ensureInitialized().hashValue(this as ServerState);
  }
}

extension ServerStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerState, $Out> {
  ServerStateCopyWith<$R, ServerState, $Out> get $asServerState =>
      $base.as((v, t, t2) => _ServerStateCopyWithImpl(v, t, t2));
}

abstract class ServerStateCopyWith<$R, $In extends ServerState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ReceiveSessionStateCopyWith<$R, ReceiveSessionState, ReceiveSessionState>?
      get session;
  WebSendStateCopyWith<$R, WebSendState, WebSendState>? get webSendState;
  $R call(
      {HttpServer? httpServer,
      String? alias,
      int? port,
      bool? https,
      ReceiveSessionState? session,
      WebSendState? webSendState});
  ServerStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerState, $Out>
    implements ServerStateCopyWith<$R, ServerState, $Out> {
  _ServerStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerState> $mapper =
      ServerStateMapper.ensureInitialized();
  @override
  ReceiveSessionStateCopyWith<$R, ReceiveSessionState, ReceiveSessionState>?
      get session => $value.session?.copyWith.$chain((v) => call(session: v));
  @override
  WebSendStateCopyWith<$R, WebSendState, WebSendState>? get webSendState =>
      $value.webSendState?.copyWith.$chain((v) => call(webSendState: v));
  @override
  $R call(
          {HttpServer? httpServer,
          String? alias,
          int? port,
          bool? https,
          Object? session = $none,
          Object? webSendState = $none}) =>
      $apply(FieldCopyWithData({
        if (httpServer != null) #httpServer: httpServer,
        if (alias != null) #alias: alias,
        if (port != null) #port: port,
        if (https != null) #https: https,
        if (session != $none) #session: session,
        if (webSendState != $none) #webSendState: webSendState
      }));
  @override
  ServerState $make(CopyWithData data) => ServerState(
      httpServer: data.get(#httpServer, or: $value.httpServer),
      alias: data.get(#alias, or: $value.alias),
      port: data.get(#port, or: $value.port),
      https: data.get(#https, or: $value.https),
      session: data.get(#session, or: $value.session),
      webSendState: data.get(#webSendState, or: $value.webSendState));

  @override
  ServerStateCopyWith<$R2, ServerState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerStateCopyWithImpl($value, $cast, t);
}
